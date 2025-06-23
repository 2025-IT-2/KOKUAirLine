package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.repo.AirportRepository;
import com.KOKUAirLine.project.service.api.ApiInfo;
import com.KOKUAirLine.project.service.api.ApiResponse;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

@SpringBootTest
public class ApiTest {

    @Autowired
    private AirportRepository airportRepository;

    private static final Map<String, String> airport_jp = Map.of(
        "NRT", "成田",
        "MNL", "ニノイ・アキノ",
        "TPE", "桃園",
        "UBN", "チンギスハーン",
        "DOH", "ハマド"
    );

    /**
     * 공공데이터 API에서 항공편 목록 불러오기
     */
    public List<ApiInfo> getFlightDataFromApi() {
        List<ApiInfo> flightList = new ArrayList<>();

        try {
            String apiUrl = "https://apis.data.go.kr/B551177/statusOfAllFltDeOdp/getFltDeparturesDeOdp"
                + "?serviceKey=RXojluH%2BtgWvwW%2B6087NqGyn%2BB0u45bD%2BEPbNu4fyLBAAv3Chk%2FnL9r1gYBcYRhB3tyyBGVXUIkYtqPoIztHvA%3D%3D"
                + "&searchDate=20250624"
                + "&numOfRows=50"
                + "&passengerOrCargo=P"
                + "&type=xml";

            URI uri = URI.create(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) uri.toURL().openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(
                conn.getResponseCode() == 200 ? conn.getInputStream() : conn.getErrorStream(), "UTF-8"
            ));

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            br.close();
            conn.disconnect();

            XmlMapper xmlMapper = new XmlMapper();
            ApiResponse response = xmlMapper.readValue(sb.toString(), ApiResponse.class);
            if (response != null && response.getBody() != null && response.getBody().getItems() != null) {
                flightList = response.getBody().getItems().getItem();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flightList;
    }

    /**
     * 테스트 전에 DB에 API 데이터 저장
     */
    @BeforeEach
    public void saveAirportDataFromApi() {
        List<ApiInfo> flightList = getFlightDataFromApi();

        for (ApiInfo apiInfo : flightList) {
            String airportCode = apiInfo.getAirportCode();
            String airportKr = apiInfo.getAirport();
            String airportJp = Optional.ofNullable(apiInfo.getAirportJp())
                                       .filter(jp -> !jp.isBlank())
                                       .orElse(airport_jp.getOrDefault(airportCode, "未登録"));

            AirportInfo airport = airportRepository.findByAirportCode(airportCode)
                .orElseGet(AirportInfo::new);

            airport.setAirportCode(airportCode);
            airport.setAirportKr(airportKr);
            airport.setAirportJp(airportJp);

            airportRepository.save(airport);
        }
    }

    /**
     * API에서 실제 데이터가 잘 오는지 확인
     */
    @Test
    public void testGetFlightDataFromApi() {
        List<ApiInfo> list = getFlightDataFromApi();
        assertTrue(list.size() > 0, "API에서 항공편 데이터가 1건 이상 와야 합니다.");
    }

    /**
     * 공항 코드로 저장/조회 테스트
     */
    @Test
    public void testFindByAirportCode() {
        AirportInfo airport = new AirportInfo();
        airport.setAirportCode("NRT");
        airport.setAirportKr("나리타");
        airport.setAirportJp("成田");
        airportRepository.save(airport);

        Optional<AirportInfo> result = airportRepository.findByAirportCode("NRT");
        assertTrue(result.isPresent());
        assertEquals("成田", result.get().getAirportJp());
    }
}
package com.KOKUAirLine.project.service.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.repo.AirportRepository;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

@Service
public class ApiService {
	
	@Autowired
	private AirportRepository airportRepository;
	
	
    public List<ApiInfo> getFlightDataFromApi() {
        List<ApiInfo> flightList = new ArrayList<>();

        try {
            String apiUrl = "https://apis.data.go.kr/B551177/statusOfAllFltDeOdp/getFltDeparturesDeOdp?serviceKey=RXojluH%2BtgWvwW%2B6087NqGyn%2BB0u45bD%2BEPbNu4fyLBAAv3Chk%2FnL9r1gYBcYRhB3tyyBGVXUIkYtqPoIztHvA%3D%3D&searchDate=20250617&numOfRows=50&passengerOrCargo=P&type=xml";

            URI uri = URI.create(apiUrl);
            URL url = uri.toURL();
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br;
            if (conn.getResponseCode() == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            conn.disconnect();

            // XML → Java 객체 매핑
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
    
    public void saveAirportDataFromApi() {
        List<ApiInfo> flightList = getFlightDataFromApi();

        for (ApiInfo apiInfo : flightList) {
            Optional<AirportInfo> optionalAirport = airportRepository.findByAirportCode(apiInfo.getAirportCode());

            if (optionalAirport.isPresent()) {
                AirportInfo existing = optionalAirport.get();

                // airportJp가 null이면 저장 X
                if (existing.getAirportJp() == null) {
                    continue;
                }

                // airportJp가 있으면 나머지드만 갱신
                existing.setAirport(apiInfo.getAirport());
                airportRepository.save(existing);

            } 	
//            else {
//                
//                AirportInfo newAirport = new AirportInfo();
//                newAirport.setAirport(apiInfo.getAirport());
//                newAirport.setAirportCode(apiInfo.getAirportCode());
//                newAirport.setAirportJp(apiInfo.getAirport());
//
//                airportRepository.save(newAirport);
//            }
        }
    }
    
//    private AirportInfo convertToAirportInfo(ApiInfo apiInfo) {
//    	AirportInfo airportInfo = new AirportInfo();
//    	airportInfo.setAirportCode(apiInfo.getAirportCode());
//    	airportInfo.setAirport(apiInfo.getAirport()); // 필요 시
//    	return airportInfo;
//    }
    
}


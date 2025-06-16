package com.KOKUAirLine.project.service.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;

@Service
public class ApiService {

    public List<ApiInfo> getFlightDataFromApi() {
        List<ApiInfo> flightList = new ArrayList<>();

        try {
            String apiUrl = "https://apis.data.go.kr/B551177/statusOfAllFltDeOdp/getFltDeparturesDeOdp?serviceKey=RXojluH%2BtgWvwW%2B6087NqGyn%2BB0u45bD%2BEPbNu4fyLBAAv3Chk%2FnL9r1gYBcYRhB3tyyBGVXUIkYtqPoIztHvA%3D%3D&numOfRows=100&passengerOrCargo=P&type=xml";

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
}

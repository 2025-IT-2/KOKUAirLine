package com.KOKUAirLine.project.service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.util.FlightInfoParser;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class ReservationService {

    private final RestTemplate restTemplate = new RestTemplate();

    public List<FlightInfo> getFlightItems(String airport) {
        String serviceKey = "RXojluH+tgWvwW+6087NqGyn+B0u45bD+EPbNu4fyLBAAv3Chk/nL9r1gYBcYRhB3tyyBGVXUIkYtqPoIztHvA==";
        String url = "https://apis.data.go.kr/B551177/statusOfAllFltDeOdp/getFltDeparturesDeOdp"
                   + "?serviceKey=" + serviceKey
                   + "&airport=" + airport
                   + "&passengerOrCargo=P&type=xml";

        String response = restTemplate.getForObject(url, String.class);
        return FlightInfoParser.parse(response); // XML 파서 호출
    }
}
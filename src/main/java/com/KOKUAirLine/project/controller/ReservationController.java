package com.KOKUAirLine.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.service.ReservationService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReservationController {

	@GetMapping("/reservation")
	public String reservation(@RequestParam(required = false) String airport, Model model) throws Exception {
	    if (airport != null && !airport.isEmpty()) {
	        List<FlightInfo> flights = reservationService.getFlightItems(airport);
	        model.addAttribute("flights", flights);
	        
	        // JSON 문자열로 변환해서 model에 추가
	        ObjectMapper objectMapper = new ObjectMapper();
	        String flightsJson = objectMapper.writeValueAsString(flights);
	        model.addAttribute("flightsJson", flightsJson);
	    }
	    return "reservation";
	}
	
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/searchResult")
    public String searchFlights(@RequestParam String airport, Model model) {
        List<FlightInfo> flights = reservationService.getFlightItems(airport);
        model.addAttribute("flights", flights);
        return "searchResult"; // JSP 경로
    }

    @PostMapping("/confirm")
    public String confirmFlight(@RequestParam String flightId, Model model) {
        model.addAttribute("selectedFlightId", flightId);
        return "reservation/confirm"; // 예약 확정 화면
    }
    
}

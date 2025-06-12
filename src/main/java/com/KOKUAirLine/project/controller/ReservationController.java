package com.KOKUAirLine.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {

	@GetMapping("/reservation")
	public String reservation() {
		
		return "reservation";
		
	}
	
//	 @PostMapping("/reservationCheckPrice")
//	    public String reservationCheckPrice(@ModelAttribute ReservationSearchForm form,
//	                                      Model model) {
//	        List<FlightDTO> flights = flightService.findFlightsMatchingCondition(form);
//
//	        model.addAttribute("flights", flights);
//	        model.addAttribute("searchInfo", form);  // 네 화면에 띄울 요약 정보
//	        return "reservation/selectFlight"; // 너가 만드는 JSP
//	    }
	

	
}

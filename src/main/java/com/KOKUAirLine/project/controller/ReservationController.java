package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {

	@GetMapping("/reservation")
	public String reservation() {
		
		return "reservation";
		
	}
	
//	@PostMapping("/reservation")
//	public String reservationEnd(@RequestParam String reservationEnd, Model model) {
//		model.addAttribute("reservationEnd", reservationEnd);
//		return "reservationCheckPrice";
//		
//	}
	
}

package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class reservationCheckPrice {
	
	@GetMapping("/reservationCheckPrice")
	public String reservation() {
		
		return "reservationCheckPrice";
		
	}

}

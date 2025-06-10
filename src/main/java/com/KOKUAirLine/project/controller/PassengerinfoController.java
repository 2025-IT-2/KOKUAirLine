package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PassengerinfoController {

	@GetMapping("/passengerinfo")
	public String passengerinfo() {
		
		return "passengerinfo";
		
	}

}

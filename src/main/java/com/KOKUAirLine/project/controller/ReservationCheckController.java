package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.service.ReservationCheckService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReservationCheckController {
	@Autowired
	private ReservationCheckService service;
	
	@GetMapping("/reservationCheck")
	public String reservationCheck(
			HttpServletResponse response) {
		
		return "reservationCheck";
	}
}

package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.service.CheckReservationService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationCheckController {
   
	@Autowired
	CheckReservationService service;
	
   @GetMapping("/reservationCheck")
   public String reservationCheck(Model model, HttpSession session) {
	   boolean reservationValid = service.getReservationInfos(model, session);
		
	   	if (reservationValid) {
	   		return "reservationCheck";
	   	}
	   	else {
	   		return "redirect:/login";
	   	}
   }
}

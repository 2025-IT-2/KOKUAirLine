package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.service.CheckReservationService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationCheckController {
   
	@Autowired
	CheckReservationService service;
	
	/*
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
   */
   @GetMapping("/reservationCheck")
   public String reservationCheck(
       @RequestParam(value = "resiNum", required = false) String resiNum,
       Model model,
       HttpSession session
   ) {
       if (resiNum != null && !resiNum.isEmpty()) {
           Reservation reservation = service.getReservationByResiNum(resiNum, model);
           return "reservationCheck"; // 단일 예약만 전달
       } else {
           boolean reservationValid = service.getReservationInfos(model, session);
           return reservationValid ? "reservationCheck" : "redirect:/login";
       }
   }
}

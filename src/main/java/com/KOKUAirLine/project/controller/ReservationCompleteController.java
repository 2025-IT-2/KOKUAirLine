package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.model.LoginDTO;
import com.KOKUAirLine.project.model.Reservation;

@Controller
public class ReservationCompleteController {

    @GetMapping("/reservationComplete")
    public String reservationComplete(Model model) {
    	
    	model.addAttribute("resiNum", new Reservation());
        return "reservationComplete";  // 뷰 리졸버가 /WEB-INF/views/reservationComplete.jsp 찾음
    }
    
}
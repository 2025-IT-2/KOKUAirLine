package com.KOKUAirLine.project.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.service.api.ApiInfo;
import com.KOKUAirLine.project.service.api.ApiService;

@Controller
public class ReservationController {

    @Autowired
    private ApiService apiService;

    @GetMapping("/reservation")
    public String showReservationPage(Model model) {
        List<ApiInfo> flightList = apiService.getFlightDataFromApi();
        model.addAttribute("flights", flightList);
        
        List<ApiInfo> distinctList = flightList.stream()
        	.distinct()
        	.collect(Collectors.toList());
        model.addAttribute("flights", distinctList);
        
        return "reservation"; // -> reservation.jsp
    }
}
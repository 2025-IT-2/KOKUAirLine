package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
public class ReservationCheckPriceController {
    private final FlightScheduleService service;

    public ReservationCheckPriceController(FlightScheduleService service) {
        this.service = service;
    }

    @PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
    		@RequestParam String departure,
            @RequestParam String arrival,
            @RequestParam String tripType, 
            @RequestParam String travelDate,
            @RequestParam String passengerCount,
            Model model
            ) {

	var flights = service.findFlights(departure, arrival);
	model.addAttribute("departure", departure);
	model.addAttribute("arrival", arrival);
	model.addAttribute("tripType", tripType);
	model.addAttribute("travelDate", travelDate);  // 추가
	model.addAttribute("passengerCount", passengerCount);  // 추가
	model.addAttribute("flightList", flights);

        return "reservationCheckPrice";
    }
}
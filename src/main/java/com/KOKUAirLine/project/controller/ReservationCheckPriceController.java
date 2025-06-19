package com.KOKUAirLine.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.service.FlightService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReservationCheckPriceController {
	
	@Autowired
	private  FlightService flightService;

	@GetMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
    	@RequestParam("dep") String dep,
    	@RequestParam("arr") String arr,
    	@RequestParam("dDate") String dDateStr,
    	@RequestParam("aDate") String aDateStr,
    	Model model) throws Exception {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dDate = formatter.parse(dDateStr);
		Date aDate = formatter.parse(aDateStr);
		
		List<FlightInfo> flights = flightService.searchFlights(dep, arr, dDate, aDate);
		model.addAttribute("flights", flights);
    	return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }
    
//    @PostMapping("/reservationCheckPrice")
//	public String reservationCheckPrice(
//			HttpServletResponse response) {
//		
//		return "reservationCheckPrice";
//	}
    
}
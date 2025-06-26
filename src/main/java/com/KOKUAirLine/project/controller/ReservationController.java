package com.KOKUAirLine.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.AirportRepository;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.service.AirportService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReservationController {
    
    @Autowired
    private AirportRepository airportRepository;
      
	@Autowired
	private AirportService airportService;
	
	@Autowired
	private FlightInfoRepository flightInfoRepository;
	
    @GetMapping("/reservation")
    public String showReservationPage(Model model) throws JsonProcessingException {
    	
    	   	
        model.addAttribute("dataList", airportService.getAirportFlights());
    	    	
        List<AirportInfo> airportList = airportRepository.findAll();
        model.addAttribute("airports", airportList);
        
//        List<String> allowedDates = airportService.getAllowedDate();
//        List<Date> allowedDates = airportService.getAllowedDate2();
//        System.out.println(allowedDates);
//        
//        ObjectMapper mapper = new ObjectMapper();
//        String allowedDatesJson = mapper.writeValueAsString(allowedDates); // 결과: ["2025-07-01", "2025-07-05"]
//        
//        model.addAttribute("allowedDatesJson", allowedDatesJson);

        
        return "reservation";
                
    }
    
}
package com.KOKUAirLine.project.controller;


import java.sql.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.service.BoardingPassInfoService;
import com.KOKUAirLine.project.service.FlightInfoService;

import jakarta.servlet.http.HttpSession;


@Controller
public class BoardingPassInfoController {
	
	@Autowired
    private FlightInfoService flightInfoService;
	
	@Autowired
    private FlightInfoRepository repository;
	@Autowired
	private BoardingPassInfoService boardingService;

    // JSP에 데이터 전달
	@GetMapping("/boardingPassInfo")
	public String boardingPassInfo(@RequestParam("reservationNumber") String reservationNumber, Model model, HttpSession session) {
	    // reservationNumber로 필요한 정보를 가져옴
	    FlightInfo flight = flightInfoService.getFlightById(reservationNumber); // 또는 예약번호로 연결된 항공편 조회
	    boardingService.getUserMail(model, session);

	    if (flight != null) {
	        model.addAttribute("departure", flight.getDeparture());
	        model.addAttribute("departureDate", flight.getDepartureDate());
	        model.addAttribute("departureTime", flight.getDepartureTime());

	        model.addAttribute("arrival", flight.getArrival());
	        model.addAttribute("arrivalDate", flight.getArrivalDate());
	        model.addAttribute("arrivalTime", flight.getArrivalTime());
	    } else {
	        System.out.println("해당 항공편이 존재하지 않습니다. reservationNumber=" + reservationNumber);
	    }

	    return "boardingPassInfo";
	}


    
    
    
}

package com.KOKUAirLine.project.controller;


import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepo;
import com.KOKUAirLine.project.service.FlightInfoService;


@Controller
public class BoardingPassInfoController {
	
	@Autowired
    private FlightInfoService flightInfoService;
	
	@Autowired
    private FlightInfoRepo repository;
	


    // JSP에 데이터 전달
    @GetMapping("/boardingPassInfo")
    public String boardingPassInfo(Model model) {
        // 예시: "KE123" 항공편 정보 조회
//    	FlightInfo flight = repository.findById("KE123").orElse(null);
    	FlightInfo flight = repository.findSummaryByFlightNo("KE123");
    	
//    	Object[] result = repository.findSummaryByFlightNo("KE123");
    	
//    	 if (flight != null) {
//    	String departure = (String) flight.departure;
//    	Date departureTime = (Date) result[1];
//    	String arrival = (String) result[2];
//    	Date arrivalTime = (Date) result[3];
//
//    	model.addAttribute("departure", departure);
//    	model.addAttribute("departureTime", departureTime);
//    	model.addAttribute("arrival", arrival);
//    	model.addAttribute("arrivalTime", arrivalTime);
//    	 } else {
//    		   model.addAttribute("departure", "정보 없음");
//    		   model.addAttribute("departureTime", null);
//    		   model.addAttribute("arrival", "정보 없음");
//    		   model.addAttribute("arrivalTime", null);
//    	 }

        if (flight != null) {
            // 필요한 필드만 JSP에 전달
            model.addAttribute("departure", flight.getDeparture());
            System.out.println("출발지: " + flight.getDeparture()); //로그용
            
            model.addAttribute("departureDate", flight.getDepartureDate());
            System.out.println("출발 날짜: " + flight.getDepartureDate()); //로그용
            
            model.addAttribute("departureTime", flight.getDepartureTime());
            System.out.println("출발 시간: " + flight.getDepartureTime()); //로그용
            
            model.addAttribute("arrival", flight.getArrival());
            System.out.println("도착지: " + flight.getArrival()); //로그용
            
            model.addAttribute("arrivalDate", flight.getArrivalDate());
            System.out.println("도착 날짜: " + flight.getArrivalDate()); //로그용
            
            model.addAttribute("arrivalTime", flight.getArrivalTime());
            System.out.println("도착 시간: " + flight.getArrivalTime()); //로그용
        }
        System.out.println(flight);
        return "boardingPassInfo"; // JSP 파일명 (boardingPassInfo.jsp)
    }

//    @GetMapping("/boardingPassInfo")
//    public String boardingPassInfo() {
//        return "boardingPassInfo"; // -> /WEB-INF/views/boardingPassInfo.jsp 로 이동
//    }

    
    
    
}

package com.KOKUAirLine.project.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.repo.AirportRepository;
import com.KOKUAirLine.project.service.api.ApiInfo;
import com.KOKUAirLine.project.service.api.ApiService;

@Controller
public class ReservationController {

    @Autowired
    private ApiService apiService;
    
    @Autowired
    private AirportRepository airportRepository;
    
    @GetMapping("/reservation")
    public String showReservationPage(Model model) {
    	
//    	apiService.saveAirportDataFromApi();// api 정보
//    	List<ApiInfo> flightList = apiService.getFlightDataFromApi();// api 정보
//        model.addAttribute("flights", flightList);
        
        List<AirportInfo> airportList = airportRepository.findAll();
        model.addAttribute("airports", airportList);
        
//        List<ApiInfo> distinctList = flightList.stream()// 중복 제거
//        	.distinct()
//        	.collect(Collectors.toList());
//        model.addAttribute("flights", distinctList);
        
//        for (ApiInfo apiInfo : flightList) {
//            String airportCode = apiInfo.getAirportCode();
//            String airportJp = apiInfo.getAirportJp();
//
//            // airportJp가 null이거나 빈 문자열일 때 처리
//            if (airportJp == null || airportJp.isEmpty()) {
//                if ("NRT".equals(airportCode)) {
//                    airportJp = "成田";  // 기본값 세팅
//                }
//                if ("MNL".equals(airportCode)) {
//                	airportJp = "ニノイ・アキノ";  // 기본값 세팅
//                }
//                if ("TPE".equals(airportCode)) {
//                	airportJp = "桃園";  // 기본값 세팅
//                }
//                if ("UBN".equals(airportCode)) {
//                	airportJp = "チンギスハーン";  // 기본값 세팅
//                }
//                if ("DOH".equals(airportCode)) {
//                	airportJp = "ハマド";  // 기본값 세팅
//                }
//                
//            }
//
//            Optional<AirportInfo> optionalAirport = airportRepository.findByAirportCode(airportCode);
//
//            if (optionalAirport.isPresent()) {
//                AirportInfo existing = optionalAirport.get();
//                existing.setAirportKr(apiInfo.getAirport());
//                existing.setAirportJp(airportJp);
//                airportRepository.save(existing);
//            } else {
//                AirportInfo newAirport = new AirportInfo();
//                newAirport.setAirportCode(airportCode);
//                newAirport.setAirportKr(apiInfo.getAirport());
//                newAirport.setAirportJp(airportJp);
//                airportRepository.save(newAirport);
//            }
//        }
        
        return "reservation"; // -> reservation.jsp
    }
    
}
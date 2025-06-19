package com.KOKUAirLine.project;

import java.util.List;
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
public class ReservationTestoController {

    @Autowired
    private ApiService apiService;
    
    @Autowired
    private AirportRepository airportRepository;

    @GetMapping("/reservationTesto")
    public String showReservationPage(Model model) {
    	
    	apiService.saveAirportDataFromApi();// api 정보
    	List<ApiInfo> flightList = apiService.getFlightDataFromApi();// api 정보
        model.addAttribute("flights", flightList);
        
        List<AirportInfo> airportList = airportRepository.findAll();
        model.addAttribute("airports", airportList);
        
        List<ApiInfo> distinctList = flightList.stream()// 중복 제거
        	.distinct()
        	.collect(Collectors.toList());
        model.addAttribute("flights", distinctList);
        
        return "reservationTesto"; // -> reservationTesto.jsp
    }
}
package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PassengerinfoController {

	@GetMapping("/passengerinfo")
	public String passengerinfo() {	
		return "passengerinfo";
		
	}

//    // 인원 선택 페이지로 이동
//    @GetMapping("/adultSelectTesto")
//    public String adultSelectTesto() {
//        return "adultSelectTesto"; // adultSelectTesto.jsp로 이동
//    }
//
//    // 탑승자 정보 입력 페이지로 이동
//    @GetMapping("/passengerinfo") 
//    public String showPassengerInfo(@RequestParam(name="adultCount", defaultValue = "1") int adultCount, Model model) {
//        model.addAttribute("adultCount", adultCount);
//        
//        // 결제 금액 계산 예시
//        int pricePerAdult = 10000;
//        int amount = adultCount * pricePerAdult;
//        model.addAttribute("amount", amount);
//        
//        return "passengerinfo"; // passengerinfo.jsp로 이동
//    }
}		

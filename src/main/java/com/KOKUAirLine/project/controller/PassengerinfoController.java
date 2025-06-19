package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PassengerinfoController {

	@GetMapping("/passengerInfo")
	public String passengerInfo() {	
		return "passengerInfo";
		
	}

    

//    // 탑승자 정보 입력 페이지로 이동
//    @PostMapping("/passengerInfo")
//    public String passengerInfo(
//            @RequestParam("adultCount") int adultCount,
//            @RequestParam("childCount") int childCount,
//            @RequestParam("infantCount") int infantCount,
//            Model model) {
//
//        model.addAttribute("adultCount", adultCount);
//        model.addAttribute("childCount", childCount);
//        model.addAttribute("infantCount", infantCount);
//
//        // 결제 금액 계산 예시
//        int pricePerAdult = 10000;
//        int pricePerChild = 8000;
//        int pricePerInfant = 3000;
//
//        int amount = (adultCount * pricePerAdult) + (childCount * pricePerChild) + (infantCount * pricePerInfant);
//        model.addAttribute("amount", amount);
//
//        return "passengerInfo"; // passengerInfo.jsp로 이동
//    }
}		

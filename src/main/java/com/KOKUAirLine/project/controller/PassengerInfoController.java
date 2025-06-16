package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PassengerInfoController {

	@GetMapping("/passengerInfo")
	public String passengerinfo() {	
		return "passengerInfo";
		
	}

    // 인원 선택 페이지로 이동
    @GetMapping("/adultSelectTesto")
    public String adultSelectTesto() {
        return "adultSelectTesto"; // adultSelectTesto.jsp로 이동
    }
    

//    // 탑승자 정보 입력 페이지로 이동
//    @GetMapping("/passengerInfo")
//    public String showPassengerInfo(
//            @RequestParam(name="adultCount", defaultValue = "1") int adultCount,
//            @RequestParam(name="childCount", defaultValue = "0") int childCount,
//            @RequestParam(name="infantCount", defaultValue = "0") int infantCount,
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
//        return "passengerInfo"; // passengerinfo.jsp로 이동
//    }
}		

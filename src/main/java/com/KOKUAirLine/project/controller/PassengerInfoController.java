package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.service.PassengerInfoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PassengerInfoController {

    // 탑승자 정보 입력 페이지로 이동
	@GetMapping("/passengerInfo")
    public String passengerInfo(
            @RequestParam("adultCount") int adultCount,
            @RequestParam("childCount") int childCount,
            @RequestParam("infantCount") int infantCount,
            @RequestParam(defaultValue = "0") int totalPrice,
            HttpSession session,            
            Model model) {

        // 세션에서 로그인된 userId 꺼내기    	
        String loginUserId = (String) session.getAttribute("loginUserId");

        // 로그인 안된 경우 로그인 페이지로 리다이렉트        
        if (loginUserId == null) {
            return "redirect:/login";
        }

        // 서비스 호출
        String phoneNumber = passengerInfoService.getPhoneNumberByUserId(loginUserId);
//        int amount = passengerInfoService.calculateAmount(adultCount, childCount, infantCount);

        // JSP에 데이터 전달        
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childCount", childCount);
        model.addAttribute("infantCount", infantCount);
        model.addAttribute("phone", phoneNumber);
	    model.addAttribute("totalPrice", totalPrice);
//        model.addAttribute("amount", amount);

        return "passengerInfo";
		
	}

			
	// PassengerInfoService 호출
    @Autowired
    private PassengerInfoService passengerInfoService;


    @PostMapping("/submitPassengerInfo")
    public String submitPassengerInfo(HttpServletRequest request, HttpSession session) {

        // 세션에서 로그인 유저 id 꺼내기    	
        String loginUserId = (String) session.getAttribute("loginUserId");

        // passenger 수만큼 데이터 받아오기
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));

        // 서비스 호출(대인, 소아, 유아 각각 저장)
        passengerInfoService.savePassengerInfo(request, "大人", adultCount);
        passengerInfoService.savePassengerInfo(request, "小児", childCount);
        passengerInfoService.savePassengerInfo(request, "幼児", infantCount);

        return "redirect:/home"; // 저장 후 홈으로 이동
    }
}

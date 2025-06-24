package com.KOKUAirLine.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.service.PassengerInfoService;
import com.KOKUAirLine.project.service.PassengerInfoService.ReservationPair;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PassengerInfoController {

    @Autowired
    private PassengerInfoService passengerInfoService;
    
    // 1. 탑승자 정보 입력 페이지로 이동
    @GetMapping("/passengerInfo")
    public String passengerInfo(
            @RequestParam("adultCount") int adultCount,
            @RequestParam("childCount") int childCount,
            @RequestParam("infantCount") int infantCount,
            @RequestParam(defaultValue = "0") int totalPrice,
            @RequestParam("selectedFlightNo") String selectedFlightNo,
            @RequestParam(required = false) String arrivalFlightNo,
            @RequestParam(defaultValue = "0") int depAirFare,
            @RequestParam(defaultValue = "0") int arrAirFare,
            HttpServletRequest request,
            HttpSession session,
            Model model) {

        // 로그인 여부 확인
        String loginUserId = (String) session.getAttribute("loginUserId");
        if (loginUserId == null) {
            return "redirect:/login";
        }

        // 유저 정보에서 전화번호 가져오기
        String phoneNumber = passengerInfoService.getPhoneNumberByUserId(loginUserId);

        // JSP에 전달할 값 설정
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childCount", childCount);
        model.addAttribute("infantCount", infantCount);
        model.addAttribute("phone", phoneNumber);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("selectedFlightNo", selectedFlightNo);
        model.addAttribute("arrivalFlightNo", arrivalFlightNo);
        model.addAttribute("depAirFare", depAirFare);
        model.addAttribute("arrAirFare", arrAirFare);

        System.out.println("✅ depAirFare: " + request.getParameter("depAirFare"));
        System.out.println("✅ arrAirFare: " + request.getParameter("arrAirFare"));
        System.out.println("✅ totalPrice: " + request.getParameter("totalPrice"));
        
        return "passengerInfo";
    }

    // 2. 탑승자 정보 최종 제출 → 예약 + 결제 저장
    @PostMapping("/submitPassengerInfo")
    public String submitPassengerInfo(HttpServletRequest request, HttpSession session) {

        String loginUserId = (String) session.getAttribute("loginUserId");
        if (loginUserId == null) {
            return "redirect:/login";
        }

        // 인원수 파라미터
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));

        // 🔥 예약 먼저 저장
        ReservationPair reservationPair = passengerInfoService.saveReservationInfo(request, loginUserId);

        // 🔥 예약 객체에 여권 연결 저장
        if (reservationPair.getDepReservation() != null) {
            passengerInfoService.savePassengerInfo(request, "大人", adultCount, reservationPair.getDepReservation());
            passengerInfoService.savePassengerInfo(request, "小児", childCount, reservationPair.getDepReservation());
            passengerInfoService.savePassengerInfo(request, "幼児", infantCount, reservationPair.getDepReservation());
        }

        if (reservationPair.getArrReservation() != null) {
            passengerInfoService.savePassengerInfo(request, "大人", adultCount, reservationPair.getArrReservation());
            passengerInfoService.savePassengerInfo(request, "小児", childCount, reservationPair.getArrReservation());
            passengerInfoService.savePassengerInfo(request, "幼児", infantCount, reservationPair.getArrReservation());
        }

        return "redirect:/home";
    }
}
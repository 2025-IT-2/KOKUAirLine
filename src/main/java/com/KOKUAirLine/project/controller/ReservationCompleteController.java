package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationCompleteController {

	@GetMapping("/reservationComplete")
	public String reservationComplete(HttpSession session, Model model) {
		// 세션에서 예약번호 꺼내기
	    Long depResiNum = (Long) session.getAttribute("depResiNum");
	    Long arrResiNum = (Long) session.getAttribute("arrResiNum");

	    // 모델에 넣기 → JSP에서 출력용
	    model.addAttribute("depResiNum", depResiNum);
	    model.addAttribute("arrResiNum", arrResiNum);

	    return "reservationComplete";  // 팝업 JSP
	}
    
}
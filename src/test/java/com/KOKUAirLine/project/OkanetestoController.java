package com.KOKUAirLine.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OkanetestoController {


    // 입력 폼 보여주는 메서드 (GET /okanetesto)
	@GetMapping("/okanetesto")
	public String okanetesto() {		
		return "okanetesto";
		
	}

    // 금액 전달 받아서 출력 페이지로
    @GetMapping("/passengerinfo")
    public String showPassengerInfo(@RequestParam(name = "amount", required = false) String amount, Model model) {
        model.addAttribute("amount", amount);
        return "passengerinfo";  // templates/passengerinfo.jsp 또는 passengerinfo.html
    }
	
}

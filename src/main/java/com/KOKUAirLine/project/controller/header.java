package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class header {
	
	@GetMapping("/header")
    public String home() {
        return "header"; // -> /WEB-INF/views/home.jsp 로 이동
    }
}

package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
//  /WEB-INF/views/login.jsp 페이지로 이동
    @GetMapping("/login")
    public String getLoginPage() {
    	return "login"; 
    }
    
    // Login 가능한지 정보를 LoginService로 전달
    @PostMapping("/login")
    public String submitLogin(
    		@RequestParam String userId,
    		@RequestParam String password){
    	
    	return "redirect:/home";
    }
}

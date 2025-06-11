package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String home() {
        return "home"; // -> /WEB-INF/views/home.jsp 로 이동
    }
    
    // 로그아웃시 세션을 제거하고 홈으로 리턴
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "home";
    }
}

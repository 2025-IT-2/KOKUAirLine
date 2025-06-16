package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import com.KOKUAirLine.project.service.HomeService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;

    @GetMapping("/home")
    public String home(HttpServletRequest request,
    		HttpSession session, Model model) {
    	// 현재 로그인 상태가 아니고, 자동 로그인 쿠키가 활성화 되어있으면 자동 로그인
    	if (session.getAttribute("loginUserId") == null) {
    		service.autoLogin(request, session);
    	}
    	
    	// 상품 이미지 전달
    	service.loadTaxFreeItems(model);
    	
        return "home"; // -> /WEB-INF/views/home.jsp 로 이동
    }
}

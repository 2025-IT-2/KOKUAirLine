package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
//  /WEB-INF/views/login.jsp 페이지로 이동
    @GetMapping("/login")
    public String getLoginPage() {
    	return "login"; 
    }
    
    // Login 가능한지 정보를 LoginService로 전달
    // 로그인 성공시 home으로 전송, 실패시 화면을 다시 로드하고 알림 출력
    @PostMapping("/login")
    public String submitLogin(
    		@RequestParam String userId,
    		@RequestParam String password,
    		HttpSession session,
    		RedirectAttributes redirectAttributes){
    	if(service.LoginCheck(userId, password)) {
    		session.setAttribute("loginUserId", userId);
    		return "redirect:/home";
    	}
    	else {
    		//리다이렉트 된 주소로 attribute를 추가해 보내줌
    		redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
            return "redirect:/login";  // 스프링부트에서 지원하는 get 방식 redirect 호출문
    	}
    }
}

package com.KOKUAirLine.project.controller;

import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.model.LoginDTO;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
//  /WEB-INF/views/login.jsp 페이지로 이동
		@GetMapping("/login")
		public String loginForm(Model model) {
		    model.addAttribute("userInfo", new LoginDTO());
		    return "login";
		}
    
    // Login 가능한지 정보를 LoginService로 전달
    // 로그인 성공시 home으로 전송, 실패시 화면을 다시 로드하고 알림 출력
		@PostMapping("/login")
		public String login(@ModelAttribute("userInfo") @Valid LoginDTO loginDTO,
        @RequestParam(required = false) String autoLogin,
        BindingResult bindingResult,
        Model model,
        HttpSession session,
        HttpServletResponse response,
        RedirectAttributes redirectAttributes) {

    	
    	// 유효성 검사 실패 시 다시 폼으로
    	if (bindingResult.hasErrors()) {
    		
	        return "login";
	    }

    	
    	if(service.loginCheck(loginDTO.getUserId(), loginDTO.getPassword(), session)) {
    		if(autoLogin != null) { // 자동 로그인 활성화시 24시간 동안 쿠키에 유저 id 저장
    			response.addCookie(service.setAutoLogin(autoLogin, loginDTO.getUserId()));
    		}
    		
    		return "redirect:/home";
    	}
    	else {
    		//리다이렉트 된 주소로 attribute를 추가해 보내줌
    		redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
        return "redirect:/login";
    	}
    }
    
 // 로그아웃시 세션을 제거하고 홈으로 리턴
    @GetMapping("/logout")
    public String logout(HttpSession session, 
    		HttpServletRequest request,
    		HttpServletResponse response) {
    	service.logout(session, request, response);
    	return "redirect:/home";
    }
}

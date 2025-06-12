package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;

@Service
public class HomeService {
	
	@Autowired
	LoginService loginService;
	
	// 자동 로그인 호출 함수. 실행시 쿠키에 autoLogin 데이터가 있나 확인하고 로그인 처리
	public boolean autoLogin(HttpServletRequest request, HttpSession session) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("userId".equals(c.getName())) {
					String userId = c.getValue();
					if(loginService.loginCheckById(userId)) {
						System.out.println("setting session?");
						// 데이터 일치시 세션에 로그인 설정
						session.setAttribute("loginUserId", userId);
						return true;
					}
					break;
				}
			}
		}
		
		return false;
	}
}

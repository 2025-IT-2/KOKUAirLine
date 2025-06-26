package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class LoginService {
	
	@Autowired
	private UserInfoRepo repo;
	
	// 유저가 입력한 id, pw가 저장된 정보랑 같은지 확인
	// userInfo를 못찾으면 false, 찾았고 id, pw가 같으면 성공!
	public boolean loginCheck(String userId, String password, HttpSession session) {
		UserInfo userInfo = repo.searchUser(userId, password);
		
		if (userInfo == null) {
			return false;
		}
		
		if(userInfo.getUserId().equals(userId) && userInfo.getPassword().equals(password)) {
			// 로그인 성공시 session에 로그인 정보 저장
			session.setAttribute("loginUserId", userId);
			return true;
		}
		
		return false;
	}
	
	// 자동 로그인을 위한 쿠키 설정
	public Cookie setAutoLogin(String autoLogin, String userId) {
		if(autoLogin != null) { // 자동 로그인 활성화시 24시간 동안 쿠키에 유저 id 저장
			Cookie cookie = new Cookie("userId", userId);
			cookie.setMaxAge(60*60*24); // 초단위 저장. 0은 쿠키 제거, 음수는 쿠키 저장 안함
			cookie.setPath("/"); // 쿠키를 모든 경로에서 볼 수 있게
			return cookie;
		}
		
		return null;
	}
	
	// id 로만 로그인
	//당장은 자동 로그인용으로 활용중
	public boolean loginCheckById(String userId) {
		UserInfo userInfo = repo.searchUserById(userId);
		
		if (userInfo == null) {
			return false;
		}
		else if(userInfo.getUserId().equals(userId)) {
			return true;
		}
		
		return false;
	}
	
	// 로그아웃
	// 로그아웃시 쿠키가 남아있다면 쿠키를 제거한다
	public void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("userId".equals(c.getName())) {
					// 삭제용 쿠키 생성
	                Cookie deleteCookie = new Cookie("userId", null);
	                deleteCookie.setMaxAge(0);      // 즉시 만료
	                deleteCookie.setPath("/");      // 경로도 설정해야 제대로 삭제됨
	                response.addCookie(deleteCookie);
					break;
				}
			}
		}
	}
	
}

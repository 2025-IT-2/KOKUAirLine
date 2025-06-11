package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

@Service
public class LoginService {
	
	@Autowired
	private UserInfoRepo repo;
	
	// 유저가 입력한 id, pw가 저장된 정보랑 같은지 확인
	// userInfo를 못찾으면 false, 찾았고 id, pw가 같으면 성공!
	public boolean LoginCheck(String userId, String password) {
		UserInfo  userInfo = repo.searchUser(userId, password);
		
		System.out.println(userInfo);
		
		if (userInfo == null) {
			return false;
		}
		
		if(userInfo.getUserId().equals(userId) && userInfo.getPassword().equals(password)) {
			return true;
		}
		
		return false;
	}
	
}

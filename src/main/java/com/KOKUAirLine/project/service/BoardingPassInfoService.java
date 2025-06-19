package com.KOKUAirLine.project.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.servlet.http.HttpSession;

@Service
public class BoardingPassInfoService {
	
	@Autowired
	private UserInfoRepo repo;
	
	public void getUserMail(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("loginUserId");
		if (userId == null) {
			return;
		}
		String email = repo.findById(userId).get().getEmail();
		if (email != null && email.contains("@")) {
		    String domain = email.substring(email.indexOf("@") + 1);
		    String url = "mail." + domain;
		    model.addAttribute("mailUrl", url);
		} else {
		    model.addAttribute("mailUrl", "mail.google.com");
		}
	}
}

package com.KOKUAirLine.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.repo.ReservationRepo;

import jakarta.servlet.http.HttpSession;

@Service
public class CheckReservationService {
	@Autowired
	private ReservationRepo resrevationRepo;
	
	public boolean getReservationInfos(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("loginUserId");
		if ( userId != null ) {
			List<Reservation> resList = resrevationRepo.findByReservationHolder(userId);
			model.addAttribute("resList", resList);
			
			return true;
		}
		else {
			return false;
		}
	}
}

package com.KOKUAirLine.project.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KOKUAirLine.project.model.PaymentInfo;
import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.repo.PaymentInfoRepo;
import com.KOKUAirLine.project.repo.ReservationRepo;

import jakarta.servlet.http.HttpSession;

@Service
public class CheckReservationService {
	@Autowired
	private ReservationRepo resrevationRepo;
	@Autowired
	private PaymentInfoRepo paymentInfoRepo;
	
	public boolean getReservationInfos(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("loginUserId");
		if ( userId != null ) {
			// 현재 로그인한 사람의 id를 이용해 해당 id에 예약 리스트를 model에 저장
			List<Reservation> resList = resrevationRepo.findByReservationHolder(userId);
			model.addAttribute("resList", resList);
			
			// 각 예약에 대해 결제 정보도 model에 저장
			Map<Long, PaymentInfo> resPayMap = new LinkedHashMap<>();
			for (Reservation res : resList) {
				resPayMap.put(res.getResiNum(), paymentInfoRepo.findByReservation_ResiNum(res.getResiNum()));
			}
			model.addAttribute("resPayMap", resPayMap);
			
			return true;
		}
		else {
			return false;
		}
	}
	public List<Reservation> getUserReservations(HttpSession session) {
		String userId = (String) session.getAttribute("loginUserId");
		if (userId != null) {
			return resrevationRepo.findByReservationHolder(userId);
		}
		return new ArrayList<>();
	}
	
	public Reservation getReservationByResiNum(String resiNum, Model model) {
		try {
			Integer resiNumInt = Integer.parseInt(resiNum);
			Optional<Reservation> optionalReservation = resrevationRepo.findDetailByResiNum(resiNumInt);

			if (optionalReservation.isPresent()) {
				Reservation reservation = optionalReservation.get();

				model.addAttribute("resList", List.of(reservation));
				model.addAttribute("resPayMap", Map.of(
					reservation.getResiNum(),
					paymentInfoRepo.findByReservation_ResiNum(reservation.getResiNum())
				));
				return reservation;
			}
		} catch (NumberFormatException e) {
			// 잘못된 형식의 예약번호 (예: 문자열 입력)
		}

		return null;
	}

}



package com.KOKUAirLine.project.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;

//import com.KOKUAirLine.project.model.UserInfo;
//import com.KOKUAirLine.project.repo.UserInfoRepo;

//import jakarta.servlet.http.HttpSession;

@Controller
public class PassengerInfoController {

	@GetMapping("/passengerInfo")
	public String passengerInfo() {	
		return "passengerInfo";
		
	}

//    @Autowired
//    private UserInfoRepo userInfoRepo;

//    // 탑승자 정보 입력 페이지로 이동
//    @PostMapping("/passengerInfo")
//    public String passengerInfo(
//            @RequestParam("adultCount") int adultCount,
//            @RequestParam("childCount") int childCount,
//            @RequestParam("infantCount") int infantCount,
//            HttpSession session,            
//            Model model) {
//
//        // 세션에서 로그인된 userId 꺼내기
//        String loginUserId = (String) session.getAttribute("loginUserId");
//
//        // DB에서 유저 정보 조회
//        UserInfo loginUser = userInfoRepo.searchUserById(loginUserId);
//        
//        // 유저 전화번호 꺼내기
//        String phoneNumber = loginUser.getUserPhone();
//
//        // JSP에 데이터 전달
//        model.addAttribute("adultCount", adultCount);
//        model.addAttribute("childCount", childCount);
//        model.addAttribute("infantCount", infantCount);
//        model.addAttribute("phone", phoneNumber);
//
//        // 결제 금액 계산 예시
//        int pricePerAdult = 10000;
//        int pricePerChild = 8000;
//        int pricePerInfant = 3000;
//
//        int amount = (adultCount * pricePerAdult) + (childCount * pricePerChild) + (infantCount * pricePerInfant);
//        model.addAttribute("amount", amount);
//
//        return "passengerInfo"; // passengerInfo.jsp로 이동
//    }
}		

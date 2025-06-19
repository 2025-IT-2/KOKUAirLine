package com.KOKUAirLine.project.controller;

//import java.time.LocalDate;
//
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.KOKUAirLine.project.model.PassportInfo;
//import com.KOKUAirLine.project.model.UserInfo;
//import com.KOKUAirLine.project.repo.PassportInfoRepository;
//import com.KOKUAirLine.project.repo.UserInfoRepo;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;

@Controller
public class PassengerInfoController {

	@GetMapping("/passengerInfo")
	public String passengerInfo() {	
		return "passengerInfo";
		
	}

	
//	// 회원정보 DB에서 전화번호 불러오기 
//    @Autowired
//    private UserInfoRepo userInfoRepo;
//
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
//    
//    
//    // 입력한 정보 여권 정보 DB로 이동
//    @Autowired
//    private PassportInfoRepository passportInfoRepository;
//
//    @PostMapping("/submitPassengerInfo")
//    public String submitPassengerInfo(HttpServletRequest request, HttpSession session) {
//
//        // 세션에서 로그인 유저 id 꺼내기
//        String loginUserId = (String) session.getAttribute("loginUserId");
//
//        // passenger 수만큼 데이터 받아오기
//        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
//        int childCount = Integer.parseInt(request.getParameter("childCount"));
//        int infantCount = Integer.parseInt(request.getParameter("infantCount"));
//
//        // 대인 저장
//        savePassengerInfo(request, "大人", adultCount);
//
//        // 소아 저장
//        savePassengerInfo(request, "小児", childCount);
//
//        // 유아 저장
//        savePassengerInfo(request, "幼児", infantCount);
//
//        return "redirect:/home"; // 저장 후 홈으로 이동
//    }
//
//    // 탑승객 저장 공통 메서드
//    private void savePassengerInfo(HttpServletRequest request, String type, int count) {
//        for (int i = 1; i <= count; i++) {
//            String lastName = request.getParameter(type + "_lastName" + i);
//            String firstName = request.getParameter(type + "_firstName" + i);
//            String birthdate = request.getParameter(type + "_birthdate" + i);
//            String gender = request.getParameter(type + "_gender" + i);
//            String passportNumber = request.getParameter(type + "_passportNumber" + i);
//            String passportExpiry = request.getParameter(type + "_passportExpiry" + i);
//            String nationality = request.getParameter(type + "_nationality" + i);
//            String passportCountry = request.getParameter(type + "_passportCountry" + i);
//
//            if (passportNumber != null && !passportNumber.isEmpty()) {
//                PassportInfo passportInfo = new PassportInfo();
//                passportInfo.setPassportNumber(passportNumber);
//                passportInfo.setEngLastName(lastName);
//                passportInfo.setEngFirstName(firstName);
//                passportInfo.setDateOfBirth(LocalDate.parse(birthdate));
//                passportInfo.setGender(gender);
//                passportInfo.setExpiredDate(LocalDate.parse(passportExpiry));
//                passportInfo.setNationality(nationality);
//                passportInfo.setIssuingCountry(passportCountry);
//
//                // DB 저장
//                passportInfoRepository.save(passportInfo);
//            }
//        }
//
//    }
}		

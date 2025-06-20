package com.KOKUAirLine.project.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.PassportInfo;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.PassportInfoRepository;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class PassengerInfoService {

	// 회원정보 DB에서 전화번호 불러오기 
    @Autowired
    private UserInfoRepo userInfoRepo;

    // 입력한 정보 여권 정보 DB로 이동    
    @Autowired
    private PassportInfoRepository passportInfoRepository;

    // 로그인 유저의 전화번호 조회
    public String getPhoneNumberByUserId(String userId) {       
    	UserInfo loginUser = userInfoRepo.searchUserById(userId);
        return loginUser.getUserPhone();
    }

    // 결제 금액 계산
    public int calculateAmount(int adultCount, int childCount, int infantCount) {
        int pricePerAdult = 10000;
        int pricePerChild = 8000;
        int pricePerInfant = 3000;

        return (adultCount * pricePerAdult) + (childCount * pricePerChild) + (infantCount * pricePerInfant);
    }

    // 탑승객 저장 공통 메서드
    public void savePassengerInfo(HttpServletRequest request, String type, int count) {
        for (int i = 1; i <= count; i++) {
            String engLastName = request.getParameter(type + "_engLastName" + i);
            String engFirstName = request.getParameter(type + "_engFirstName" + i);
            String birthdate = request.getParameter(type + "_birthdate" + i);
            String gender = request.getParameter(type + "_gender" + i);
            String passportNumber = request.getParameter(type + "_passportNumber" + i);
            String passportExpiry = request.getParameter(type + "_passportExpiry" + i);
            String nationality = request.getParameter(type + "_nationality" + i);
            String passportCountry = request.getParameter(type + "_passportCountry" + i);

            if (passportNumber != null && !passportNumber.isEmpty()) {
                PassportInfo passportInfo = new PassportInfo();
                passportInfo.setPassportNumber(passportNumber);
                passportInfo.setEngLastName(engLastName);
                passportInfo.setEngFirstName(engFirstName);
                passportInfo.setDateOfBirth(LocalDate.parse(birthdate));
                passportInfo.setGender(gender);
                passportInfo.setExpiredDate(LocalDate.parse(passportExpiry));
                passportInfo.setNationality(nationality);
                passportInfo.setIssuingCountry(passportCountry);

                // DB 저장
                passportInfoRepository.save(passportInfo);
            }
        }
    }
}


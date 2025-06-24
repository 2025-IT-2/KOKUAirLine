package com.KOKUAirLine.project.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.PassportInfo;
import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.repo.PassportInfoRepository;
import com.KOKUAirLine.project.repo.ReservationRepo;
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
    
    // 받은 정보 예약 정보 DB로 이동    
    @Autowired
    private ReservationRepo reservationRepo;    

    @Autowired
    private FlightInfoRepository flightInfoRepo;
    
    // 로그인 유저의 전화번호 조회
    public String getPhoneNumberByUserId(String userId) {       
    	UserInfo loginUser = userInfoRepo.searchUserById(userId);
        return loginUser.getUserPhone();
    }

    // 여권 정보 저장 공통 메서드
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
    
    // 예약 정보 저장 공통 메서드    
    public void saveReservationInfo(HttpServletRequest request, String userId) {
        // 사용자 정보 조회
        UserInfo user = userInfoRepo.searchUserById(userId);

        // 인원수
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));

        // 좌석 등급
        String classType = request.getParameter("classType");

        // 기내식 여부
        String meal = request.getParameter("flightMealYN");

        // ✈️ 출발편 저장
        String depFlightNo = request.getParameter("selectedFlightNo");
        if (depFlightNo != null && !depFlightNo.isBlank()) {
            FlightInfo depFlight = flightInfoRepo.findFlightInfoByFlightNo(depFlightNo)
                .orElseThrow(() -> new IllegalArgumentException("출발 항공편을 찾을 수 없습니다: " + depFlightNo));

            Reservation depReservation = new Reservation();
            depReservation.setFlightInfo(depFlight);
            depReservation.setReservationHolder(user);
            depReservation.setResNumL(adultCount);
            depReservation.setResNumM(childCount);
            depReservation.setResNumS(infantCount);
            depReservation.setResDate(LocalDate.now());
            depReservation.setFlightMealYN(meal);
            depReservation.setClassType(classType);
            depReservation.setCancelStep(Reservation.CancelStatus.예약완료);

            reservationRepo.save(depReservation);
        }

        // ✈️ 도착편 저장
        String arrFlightNo = request.getParameter("arrivalFlightNo");
        if (arrFlightNo != null && !arrFlightNo.isBlank()) {
            FlightInfo arrFlight = flightInfoRepo.findFlightInfoByFlightNo(arrFlightNo)
                .orElseThrow(() -> new IllegalArgumentException("도착 항공편을 찾을 수 없습니다: " + arrFlightNo));

            Reservation arrReservation = new Reservation();
            arrReservation.setFlightInfo(arrFlight);
            arrReservation.setReservationHolder(user);
            arrReservation.setResNumL(adultCount);
            arrReservation.setResNumM(childCount);
            arrReservation.setResNumS(infantCount);
            arrReservation.setResDate(LocalDate.now());
            arrReservation.setFlightMealYN(meal);
            arrReservation.setClassType(classType);
            arrReservation.setCancelStep(Reservation.CancelStatus.예약완료);

            reservationRepo.save(arrReservation);
        }
    }             
}


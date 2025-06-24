package com.KOKUAirLine.project.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.PassportInfo;
import com.KOKUAirLine.project.model.PaymentInfo;
import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.repo.PassportInfoRepository;
import com.KOKUAirLine.project.repo.PaymentInfoRepo;
import com.KOKUAirLine.project.repo.ReservationRepo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

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
    
    @Autowired
    private PaymentInfoRepo paymentInfoRepo;
    
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
    @Transactional
    public void saveReservationInfo(HttpServletRequest request, String userId) {
        // 사용자 정보 조회
        UserInfo user = userInfoRepo.searchUserById(userId);

        // 인원수
        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));

        // 좌석 등급 및 기내식 여부
        String classType = request.getParameter("classType");
        String meal = request.getParameter("flightMealYN");

        // 예약 객체 선언
        Reservation depReservation = null;
        Reservation arrReservation = null;

        // ✈️ 출발편 예약 저장
        String depFlightNo = request.getParameter("selectedFlightNo");
        if (depFlightNo != null && !depFlightNo.isBlank()) {
            FlightInfo depFlight = flightInfoRepo.findFlightInfoByFlightNo(depFlightNo)
                .orElseThrow(() -> new IllegalArgumentException("출발 항공편을 찾을 수 없습니다: " + depFlightNo));

            depReservation = new Reservation();
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

        // ✈️ 도착편 예약 저장
        String arrFlightNo = request.getParameter("arrivalFlightNo");
        if (arrFlightNo != null && !arrFlightNo.isBlank()) {
            FlightInfo arrFlight = flightInfoRepo.findFlightInfoByFlightNo(arrFlightNo)
                .orElseThrow(() -> new IllegalArgumentException("도착 항공편을 찾을 수 없습니다: " + arrFlightNo));

            arrReservation = new Reservation();
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

        // 💳 출발편 결제정보 저장
        if (depReservation != null) {
            String depFareStr = request.getParameter("depAirFare");
            int depFare = depFareStr != null && !depFareStr.isBlank() ? Integer.parseInt(depFareStr) : 0;

            PaymentInfo depPayment = new PaymentInfo();
            depPayment.setReservation(depReservation);
            depPayment.setAirFare(depFare);
            depPayment.setFuelSurcharge(0);
            depPayment.setTaxCharge(0);
            depPayment.setServiceCharge(0);
            depPayment.setTravelerInsur(0);
            depPayment.setTotalFare(depFare);
            depPayment.setPaymentStat(1);

            paymentInfoRepo.save(depPayment);
        }

        // 💳 도착편 결제정보 저장
        if (arrReservation != null) {
            String arrFareStr = request.getParameter("arrAirFare");
            int arrFare = arrFareStr != null && !arrFareStr.isBlank() ? Integer.parseInt(arrFareStr) : 0;

            PaymentInfo arrPayment = new PaymentInfo();
            arrPayment.setReservation(arrReservation);
            arrPayment.setAirFare(arrFare);
            arrPayment.setFuelSurcharge(0);
            arrPayment.setTaxCharge(0);
            arrPayment.setServiceCharge(0);
            arrPayment.setTravelerInsur(0);
            arrPayment.setTotalFare(arrFare);
            arrPayment.setPaymentStat(1);

            paymentInfoRepo.save(arrPayment);
        }
    }
}


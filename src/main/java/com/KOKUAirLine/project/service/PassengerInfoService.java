package com.KOKUAirLine.project.service;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

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

    @Autowired private UserInfoRepo userInfoRepo;
    @Autowired private PassportInfoRepository passportInfoRepository;
    @Autowired private ReservationRepo reservationRepo;
    @Autowired private FlightInfoRepository flightInfoRepo;
    @Autowired private PaymentInfoRepo paymentInfoRepo;

    // ✅ 예약쌍 담을 내부 클래스
    public static class ReservationPair {
        private Reservation depReservation;
        private Reservation arrReservation;

        public ReservationPair(Reservation depReservation, Reservation arrReservation) {
            this.depReservation = depReservation;
            this.arrReservation = arrReservation;
        }

        public Reservation getDepReservation() {
            return depReservation;
        }

        public Reservation getArrReservation() {
            return arrReservation;
        }
    }

    public String getPhoneNumberByUserId(String userId) {
        UserInfo loginUser = userInfoRepo.searchUserById(userId);
        return loginUser.getUserPhone();
    }

    public void savePassengerInfo(HttpServletRequest request, String type, int count, Reservation reservation) {
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
                passportInfo.setReservation(reservation);  // 🔥 여기 핵심

                passportInfoRepository.save(passportInfo);
            }
        }
    }
    
    @Transactional
    public ReservationPair saveReservationInfo(HttpServletRequest request, String userId) {
    	
//    	System.out.println("🔍 depAirFare param: " + request.getParameter("depAirFare"));
//    	System.out.println("🔍 arrAirFare param: " + request.getParameter("arrAirFare"));
    	
        UserInfo user = userInfoRepo.searchUserById(userId);

        int adultCount = Integer.parseInt(request.getParameter("adultCount"));
        int childCount = Integer.parseInt(request.getParameter("childCount"));
        int infantCount = Integer.parseInt(request.getParameter("infantCount"));
        String classType = request.getParameter("classType");
        String meal = request.getParameter("flightMealYN");

        Reservation depReservation = null;
        Reservation arrReservation = null;

        // 출발편
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

        // 도착편
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

        // 결제정보
        if (depReservation != null) {
            int depFare = parseIntSafe(request.getParameter("depAirFare"));
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

        if (arrReservation != null) {
            int arrFare = parseIntSafe(request.getParameter("arrAirFare"));
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

        return new ReservationPair(depReservation, arrReservation);
    }

    private int parseIntSafe(String value) {
        try {
            if (value == null) return 0;
            return (int) Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

}

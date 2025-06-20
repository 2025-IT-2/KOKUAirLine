package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.PaymentInfo;
import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.repo.PaymentInfoRepo;
import com.KOKUAirLine.project.repo.ReservationRepo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

@SpringBootTest
public class ReservationDataTest {

    @Autowired
    private ReservationRepo reservationRepo;

    @Autowired
    private UserInfoRepo userInfoRepo;

    @Autowired
    private FlightInfoRepository flightInfoRepo;

    @Autowired
    private PaymentInfoRepo paymentInfoRepo;

    @BeforeEach
    void setUp() {
        reservationRepo.deleteAll();
        paymentInfoRepo.deleteAll();

        // 기존 유저, 항공편
        UserInfo user1 = userInfoRepo.searchUserById("testuser1");
        UserInfo user2 = userInfoRepo.searchUserById("testuser2");

        FlightInfo flight1 = flightInfoRepo.findById("KOKU123").orElseThrow();
        FlightInfo flight2 = flightInfoRepo.findById("KOKU456").orElseThrow();

        // 1. 예약 저장
        Reservation res1 = new Reservation(null, flight1, user1, 
                1, 0, 0, LocalDate.now(), "Y", "eco-spec", "완료");
        Reservation res2 = new Reservation(null, flight2, user2, 
                2, 1, 0, LocalDate.now(), "N", "buis", "완료");

        reservationRepo.save(res1);
        reservationRepo.save(res2);

        // 2. 결제 저장
        PaymentInfo payment1 = new PaymentInfo(null, res1, flight1.getFlightMeal(),
                100000, 10000, 2000, 500, 1500, 114000, 1);
        PaymentInfo payment2 = new PaymentInfo(null, res2, flight2.getFlightMeal(),
                200000, 15000, 3000, 700, 2000, 220700, 0);

        paymentInfoRepo.save(payment1);
        paymentInfoRepo.save(payment2);

        // 3. 예약에 결제 연결 후 업데이트
        reservationRepo.save(res1);
        reservationRepo.save(res2);
    }

    @Test
    void testReservationSaved() {
        List<Reservation> list = reservationRepo.findAll();
        assertEquals(2, list.size());
    }
}


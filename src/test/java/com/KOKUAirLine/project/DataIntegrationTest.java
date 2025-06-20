package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.*;
import com.KOKUAirLine.project.repo.*;

@SpringBootTest
public class DataIntegrationTest {

    @Autowired private UserInfoRepo userInfoRepo;
    @Autowired private FlightInfoRepository flightInfoRepo;
    @Autowired private InFlightMealRepository mealRepo;
    @Autowired private ReservationRepo reservationRepo;
    @Autowired private PaymentInfoRepo paymentInfoRepo;

    @BeforeEach
    void setUp() {
        // 초기화
    	paymentInfoRepo.deleteAll();
    	reservationRepo.deleteAll();
        userInfoRepo.deleteAll();
        flightInfoRepo.deleteAll();
        mealRepo.deleteAll();

        // 1. 유저 정보
        UserInfo user1 = new UserInfo("testuser1", "1234", "test1@example.com", "田中", "太郎",
                LocalDate.of(1995, 5, 15), true, "日本", "010-1234-5678", LocalDateTime.now());
        UserInfo user2 = new UserInfo("testuser2", "abcd", "test2@example.com", "李", "美花",
                LocalDate.of(1990, 10, 30), false, "韓国", "010-2345-6789", LocalDateTime.now());
        userInfoRepo.saveAll(List.of(user1, user2));

        // 2. 기내식
        InFlightMeal beefMeal = new InFlightMeal("ビーフステーキ");
        InFlightMeal chickenMeal = new InFlightMeal("チキンライス");
        mealRepo.saveAll(List.of(beefMeal, chickenMeal));

        // 3. 항공편
        // 1. LocalDateTime 만들기
        LocalDateTime departure1 = LocalDateTime.of(2025, 7, 1, 3, 30); // 2025-07-01 03:30
        LocalDateTime arrival1 = LocalDateTime.of(2025, 7, 1, 7, 15);   // 2025-07-01 07:15

        // 2. LocalDateTime을 java.util.Date로 변환
        Date depDate1 = Date.from(departure1.atZone(ZoneId.systemDefault()).toInstant());
        Date arrDate1 = Date.from(arrival1.atZone(ZoneId.systemDefault()).toInstant());
        
        LocalDateTime departure2 = LocalDateTime.of(2025, 7, 4, 13, 30); // 2025-07-01 03:30
        LocalDateTime arrival2 = LocalDateTime.of(2025, 7, 4, 17, 15);   // 2025-07-01 07:15
        
        // 2. LocalDateTime을 java.util.Date로 변환
        Date depDate2 = Date.from(departure2.atZone(ZoneId.systemDefault()).toInstant());
        Date arrDate2 = Date.from(arrival2.atZone(ZoneId.systemDefault()).toInstant());

        // 기내식 이름을 가져와서 사용
        FlightInfo flight1 = new FlightInfo(
            "KOKU123", beefMeal, "NRT",
            depDate1, depDate1, 1,
            "MNL", arrDate1, arrDate1, 2,
            100, 180, 300
        );

        FlightInfo flight2 = new FlightInfo(
            "KOKU456", chickenMeal, "MNL",
            depDate2, depDate2, 1,
            "NRT", arrDate2, arrDate2, 1,
            75, 150, 301
        );
        flightInfoRepo.saveAll(List.of(flight1, flight2));

        // 4. 예약 저장 (먼저)
        Reservation res1 = new Reservation(null, flight1, user1,
                1, 0, 0, LocalDate.now(), "Y", "eco-spec", "완료");

        Reservation res2 = new Reservation(null, flight2, user2,
                2, 1, 0, LocalDate.now(), "N", "buis", "완료");

        reservationRepo.saveAll(List.of(res1, res2));

        // 5. 결제 저장 (예약 참조 필요)
        PaymentInfo payment1 = new PaymentInfo(null, res1, flight1.getFlightMeal(),
                100000, 10000, 2000, 500, 1500, 114000, 1);

        PaymentInfo payment2 = new PaymentInfo(null, res2, flight2.getFlightMeal(),
                200000, 15000, 3000, 700, 2000, 220700, 0);

        paymentInfoRepo.saveAll(List.of(payment1, payment2));

        reservationRepo.saveAll(List.of(res1, res2));
    }

    @Test
    void testDataInsertedCorrectly() {
        assertEquals(2, userInfoRepo.findAll().size());
        assertEquals(2, mealRepo.findAll().size());
        assertEquals(2, flightInfoRepo.findAll().size());
        assertEquals(2, reservationRepo.findAll().size());
        assertEquals(2, paymentInfoRepo.findAll().size());
    }
}


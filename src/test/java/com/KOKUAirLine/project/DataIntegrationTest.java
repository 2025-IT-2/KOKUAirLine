package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

    @BeforeEach
    void setUp() {
        // 초기화
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
        FlightInfo flight1 = new FlightInfo("KOKU123", beefMeal, "東京",
                new Date(), new Date(), 1, "大阪", new Date(), new Date(), 2, 100, 180, 300);
        FlightInfo flight2 = new FlightInfo("KOKU456", chickenMeal, "ソウル",
                new Date(), new Date(), 1, "福岡", new Date(), new Date(), 1, 75, 150, 301);
        flightInfoRepo.saveAll(List.of(flight1, flight2));

        // 4. 예약
        Reservation res1 = new Reservation(null, flight1, user1,
                1, 0, 0, LocalDate.now(), "Y", "eco-spec", "완료");

        Reservation res2 = new Reservation(null, flight2, user2,
                2, 1, 0, LocalDate.now(), "N", "buis", "완료");

        reservationRepo.saveAll(List.of(res1, res2));
    }

    @Test
    void testDataInsertedCorrectly() {
        assertEquals(2, userInfoRepo.findAll().size());
        assertEquals(2, mealRepo.findAll().size());
        assertEquals(2, flightInfoRepo.findAll().size());
        assertEquals(2, reservationRepo.findAll().size());
    }
}

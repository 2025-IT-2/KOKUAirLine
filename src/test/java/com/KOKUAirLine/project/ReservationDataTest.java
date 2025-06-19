package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.Reservation;
import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
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

    @BeforeEach
    void setUp() {
        reservationRepo.deleteAll();

        // 기존에 저장된 유저와 항공편 불러오기
        UserInfo user1 = userInfoRepo.searchUserById("testuser1");
        UserInfo user2 = userInfoRepo.searchUserById("testuser2");

        FlightInfo flight1 = flightInfoRepo.findById("KOKU123").orElseThrow();
        FlightInfo flight2 = flightInfoRepo.findById("KOKU456").orElseThrow();

        // 예약 생성
        Reservation res1 = new Reservation(
            null,
            flight1,
            user1,
            1, 0, 0,
            LocalDate.now(),
            "Y",
            "eco-spec",
            "완료"
        );

        Reservation res2 = new Reservation(
            null,
            flight2,
            user2,
            2, 1, 0,
            LocalDate.now(),
            "N",
            "buis",
            "완료"
        );

        reservationRepo.save(res1);
        reservationRepo.save(res2);
    }

    @Test
    void testReservationSaved() {
        List<Reservation> list = reservationRepo.findAll();
        assertEquals(2, list.size());
    }
}

package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.InFlightMeal;
import com.KOKUAirLine.project.repo.FlightInfoRepository;
import com.KOKUAirLine.project.repo.InFlightMealRepository;

@SpringBootTest
public class FlightInfoDataTest {

    @Autowired
    private FlightInfoRepository flightInfoRepo;

    @Autowired
    private InFlightMealRepository inFlightMealRepo;

    @BeforeEach
    void setUp() {
        flightInfoRepo.deleteAll();

        // 저장된 기내식 불러오기
        InFlightMeal beef = inFlightMealRepo.findAll().stream()
                .filter(m -> m.getFlightMeal().equals("ビーフステーキ"))
                .findFirst().orElseThrow();
        InFlightMeal chicken = inFlightMealRepo.findAll().stream()
                .filter(m -> m.getFlightMeal().equals("チキンライス"))
                .findFirst().orElseThrow();

        // 기내식 이름을 가져와서 사용
        FlightInfo flight1 = new FlightInfo(
            "KOKU123", beef, "東京",
            new Date(), new Date(), 1,
            "大阪", new Date(), new Date(), 2,
            100, 180, 300
        );

        FlightInfo flight2 = new FlightInfo(
            "KOKU456", chicken, "ソウル",
            new Date(), new Date(), 1,
            "福岡", new Date(), new Date(), 1,
            75, 150, 301
        );

        FlightInfo flight3 = new FlightInfo(
            "KOKU789", beef, "札幌",
            new Date(), new Date(), 2,
            "名古屋", new Date(), new Date(), 2,
            50, 120, 302
        );

        flightInfoRepo.save(flight1);
        flightInfoRepo.save(flight2);
        flightInfoRepo.save(flight3);
    }

    @Test
    void testMultipleFlightInfosSaved() {
        List<FlightInfo> flights = flightInfoRepo.findAll();
        assertEquals(3, flights.size());

        List<String> ids = flights.stream().map(FlightInfo::getFlightNo).toList();
        assertTrue(ids.contains("KOKU123"));
        assertTrue(ids.contains("KOKU456"));
        assertTrue(ids.contains("KOKU789"));
    }
}

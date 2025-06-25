package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.*;
import java.io.*;
import java.net.*;
import java.nio.file.Files;
import java.time.*;
import java.util.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.KOKUAirLine.project.model.*;
import com.KOKUAirLine.project.model.Reservation.CancelStatus;
import com.KOKUAirLine.project.repo.*;
import com.KOKUAirLine.project.service.api.ApiInfo;
import com.KOKUAirLine.project.service.api.ApiResponse;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import jakarta.transaction.Transactional;

@SpringBootTest
@Transactional
@Rollback(false) // 추가
public class FullDataIntegrationTest {

    @Autowired private UserInfoRepo userInfoRepo;
    @Autowired private FlightInfoRepository flightInfoRepo;
    @Autowired private InFlightMealRepository mealRepo;
    @Autowired private ReservationRepo reservationRepo;
    @Autowired private PaymentInfoRepo paymentInfoRepo;
    @Autowired private TicketPriceRepo ticketPriceRepo;
    @Autowired private TaxFreeItemRepo taxFreeRepo;
    @Autowired private AirportRepository airportRepo;

    private static final Map<String, String> airport_jp = Map.of(
        "NRT", "成田", "MNL", "ニノイ・アキノ", "TPE", "桃園", "UBN", "チンギスハーン", "DOH", "ハマド"
    );

    private byte[] readImage(String path) {
        try {
            return Files.readAllBytes(new File(path).toPath());
        } catch (IOException e) {
            return null;
        }
    }

    private List<ApiInfo> fetchAirportApiData() {
        List<ApiInfo> list = new ArrayList<>();
        try {
            String apiUrl = "https://apis.data.go.kr/B551177/statusOfAllFltDeOdp/getFltDeparturesDeOdp"
                    + "?serviceKey=RXojluH%2BtgWvwW%2B6087NqGyn%2BB0u45bD%2BEPbNu4fyLBAAv3Chk%2FnL9r1gYBcYRhB3tyyBGVXUIkYtqPoIztHvA%3D%3D"
                    + "&searchDate=20250624&numOfRows=50&passengerOrCargo=P&type=xml";

            HttpURLConnection conn = (HttpURLConnection) new URL(apiUrl).openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            String line; while ((line = br.readLine()) != null) sb.append(line);
            br.close();

            ApiResponse response = new XmlMapper().readValue(sb.toString(), ApiResponse.class);
            if (response.getBody() != null && response.getBody().getItems() != null)
                list = response.getBody().getItems().getItem();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @BeforeEach
    void setup() {
        paymentInfoRepo.deleteAll();
        reservationRepo.deleteAll();
        userInfoRepo.deleteAll();
        flightInfoRepo.deleteAll();
        mealRepo.deleteAll();
        ticketPriceRepo.deleteAll();
        taxFreeRepo.deleteAll();
        airportRepo.deleteAll();

        // 유저
        UserInfo user1 = new UserInfo("testuser1", "1234Ua!!", "test1@example.com", "田中", "太郎",
                LocalDate.of(1995, 5, 15), true, "日本", "010-1234-5678", LocalDateTime.now());
        UserInfo user2 = new UserInfo("testuser2", "1234Ua!!", "test2@example.com", "李", "美花",
                LocalDate.of(1990, 10, 30), false, "韓国", "010-2345-6789", LocalDateTime.now());
        userInfoRepo.saveAll(List.of(user1, user2));

        // 기내식
        InFlightMeal beef = new InFlightMeal("ビーフステーキ");
        InFlightMeal chicken = new InFlightMeal("チキンライス");
        mealRepo.saveAll(List.of(beef, chicken));

        // 항공편
        FlightInfo f1 = new FlightInfo("KOKU123", beef, "NRT",
                toDate("2025-07-01T03:30"), toDate("2025-07-01T03:30"), 1,
                "MNL", toDate("2025-07-01T07:15"), toDate("2025-07-01T07:15"), 2,
                100, 180, 300);
        FlightInfo f2 = new FlightInfo("KOKU456", chicken, "MNL",
                toDate("2025-07-04T13:30"), toDate("2025-07-04T13:30"), 1,
                "NRT", toDate("2025-07-04T17:15"), toDate("2025-07-04T17:15"), 1,
                75, 150, 301);
        flightInfoRepo.saveAll(List.of(f1, f2));
        
     // 추가 항공편 4개
        FlightInfo f3 = new FlightInfo("KOKU777", beef, "NRT",
                toDate("2025-07-02T06:00"), toDate("2025-07-02T06:00"), 1,
                "TPE", toDate("2025-07-02T09:00"), toDate("2025-07-02T09:00"), 1,
                120, 170, 306);

        FlightInfo f4 = new FlightInfo("KOKU778", chicken, "TPE",
                toDate("2025-07-03T11:00"), toDate("2025-07-03T11:00"), 1,
                "NRT", toDate("2025-07-03T14:00"), toDate("2025-07-03T14:00"), 1,
                130, 165, 307);

        FlightInfo f5 = new FlightInfo("KOKU880", beef, "UBN",
                toDate("2025-07-05T08:30"), toDate("2025-07-05T08:30"), 1,
                "DOH", toDate("2025-07-05T14:10"), toDate("2025-07-05T14:10"), 2,
                150, 155, 308);

        FlightInfo f6 = new FlightInfo("KOKU881", chicken, "DOH",
                toDate("2025-07-06T20:00"), toDate("2025-07-06T20:00"), 2,
                "UBN", toDate("2025-07-07T01:45"), toDate("2025-07-07T01:45"), 1,
                140, 150, 309);

        // 저장
        flightInfoRepo.saveAll(List.of(f3, f4, f5, f6));
        
     // 2025년 7월 1일 오전 11시 출발
        FlightInfo f7 = new FlightInfo("KOKU882", beef, "NRT",
            toDate("2025-07-01T11:00"), toDate("2025-07-01T11:00"), 1,
            "TPE", toDate("2025-07-01T14:15"), toDate("2025-07-01T14:15"), 2,
            110, 140, 310);

        // 2025년 7월 4일 오후 16시 출발
        FlightInfo f8 = new FlightInfo("KOKU883", chicken, "TPE",
            toDate("2025-07-04T16:00"), toDate("2025-07-04T16:00"), 2,
            "NRT", toDate("2025-07-04T19:30"), toDate("2025-07-04T19:30"), 1,
            115, 150, 311);

        // 저장
        flightInfoRepo.saveAll(List.of(f7, f8));

        // 예약
        Reservation r1 = new Reservation(null, f1, user1, 1, 0, 0, LocalDate.now(), "Y", "eco-spec", CancelStatus.예약완료);
        Reservation r2 = new Reservation(null, f2, user2, 2, 1, 0, LocalDate.now(), "N", "buis", CancelStatus.예약완료);
        reservationRepo.saveAll(List.of(r1, r2));

        // 결제
        paymentInfoRepo.save(new PaymentInfo(null, r1, beef, 100000, 10000, 2000, 500, 1500, 114000, 1));
        paymentInfoRepo.save(new PaymentInfo(null, r2, chicken, 200000, 15000, 3000, 700, 2000, 220700, 0));

        // 티켓 가격
        ticketPriceRepo.saveAll(List.of(
            new TicketPrice("eco-spec", 15000), new TicketPrice("eco-norm", 18000),
            new TicketPrice("buis", 36000), new TicketPrice("first", 75000),
            new TicketPrice("saver", 0), new TicketPrice("standard", 3000),
            new TicketPrice("flex", 8000), new TicketPrice("adult", 100),
            new TicketPrice("child", 50), new TicketPrice("infant", 30),
            new TicketPrice("dawn", 80), new TicketPrice("morning", 100),
            new TicketPrice("afternoon", 80)
        ));

        // 면세품
        taxFreeRepo.saveAll(List.of(
            new TaxFreeItem("健康食品", readImage("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/HealthFood.png"), "健康に本当にいいのに説明方法がない", 100000),
            new TaxFreeItem("化粧品", readImage("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Cosmetics.png"), "絶対落ちない化粧品！", 200000),
            new TaxFreeItem("ワイン", readImage("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Wine.png"), "5000年産のワイン", 990000)
        ));

        // 공항
        fetchAirportApiData().forEach(api -> {
            String code = api.getAirportCode();
            String kr = api.getAirport();
            String jp = Optional.ofNullable(api.getAirportJp()).filter(s -> !s.isBlank())
                                .orElse(airport_jp.getOrDefault(code, "未登録"));

            AirportInfo a = airportRepo.findByAirportCode(code).orElse(new AirportInfo());
            a.setAirportCode(code); a.setAirportKr(kr); a.setAirportJp(jp);
            airportRepo.save(a);
        });
    }

    private Date toDate(String localDateTimeStr) {
        return Date.from(LocalDateTime.parse(localDateTimeStr).atZone(ZoneId.systemDefault()).toInstant());
    }

    @Test
    void testAllDataLoaded() {
        assertEquals(2, userInfoRepo.count());
        assertEquals(2, mealRepo.count());
        assertEquals(8, flightInfoRepo.count());
        assertEquals(2, reservationRepo.count());
        assertEquals(2, paymentInfoRepo.count());
        assertTrue(ticketPriceRepo.count() >= 13);
        assertEquals(3, taxFreeRepo.count());
        assertTrue(airportRepo.count() > 0);
    }
}

package com.KOKUAirLine.project.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.Flight;


//import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
public class ReservationCheckPriceController {

    @GetMapping("/reservationCheckPrice")
    public String mockReservationCheckPrice(Model model) {

        List<Flight> flightList = new ArrayList<>();

        // ✅ id 부여 추가
        Flight flight1 = new Flight(
            1L, "OZ172", "A320", "08:50", "11:15",
            16200, 9, 20600, 9, 37000, 9
        );
        Flight flight2 = new Flight(
            2L, "OZ172", "A320", "10:00", "01:05",
            13000, 15, 15000, 5, 32000, 4
        );

        flightList.add(flight1);
        flightList.add(flight2);

        model.addAttribute("flightList", flightList);
        model.addAttribute("departure", "仁川");
        model.addAttribute("arrival", "沖縄");
        model.addAttribute("travelDate", "25.06.09-25.06.15");
        model.addAttribute("passengerCount", 2);

        return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }

    @PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
        @RequestParam String departure,
        @RequestParam String arrival,
        @RequestParam String tripType,
        @RequestParam String travelDate,
        @RequestParam String passengerCount,
        Model model
    ) {
        // 실제 구현 시 DB에서 flightList를 가져오는 서비스 호출 예정

        // TODO: 추후 service로 대체
        List<Flight> flightList = new ArrayList<>();
        Flight mockFlight = new Flight(
            3L, "OZ999", "B737", "12:00", "14:30",
            15000, 5, 18000, 3, 25000, 2
        );
        flightList.add(mockFlight);

        model.addAttribute("departure", departure);
        model.addAttribute("arrival", arrival);
        model.addAttribute("tripType", tripType);
        model.addAttribute("travelDate", travelDate);
        model.addAttribute("passengerCount", passengerCount);
        model.addAttribute("flightList", flightList);

        return "reservationCheckPrice";
    }
}

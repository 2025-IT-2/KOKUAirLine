package com.KOKUAirLine.project.controller;

import java.util.List;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


//import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
//@RequestMapping("/reservation")
public class ReservationCheckPriceController {

//    private final FlightScheduleService service;
//
//    public ReservationCheckPriceController(FlightScheduleService service) {
//        this.service = service;
//    }

    // ✅ 테스트용 가상 데이터 (개발 초기 단계에서 GET으로 JSP 확인 시 유용)
    @GetMapping("/reservationCheckPrice")
    public String mockReservationCheckPrice(Model model) {
        

        return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }

    // ✅ 실제 POST 요청 처리 (폼 전송 시)
    @PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
        @RequestParam String departure,
        @RequestParam String arrival,
        @RequestParam String tripType,
        @RequestParam String travelDate,
        @RequestParam String passengerCount,
        Model model
    ) {
        // DB 또는 서비스로부터 항공편 리스트 가져오기
//        List<FlightDTO> flights = service.findFlights(departure, arrival);

        // 모델에 폼 데이터와 결과 리스트 전달
        model.addAttribute("departure", departure);
        model.addAttribute("arrival", arrival);
        model.addAttribute("tripType", tripType);
        model.addAttribute("travelDate", travelDate);
        model.addAttribute("passengerCount", passengerCount);
//        model.addAttribute("flightList", flights);

        return "reservationCheckPrice";
    }
}

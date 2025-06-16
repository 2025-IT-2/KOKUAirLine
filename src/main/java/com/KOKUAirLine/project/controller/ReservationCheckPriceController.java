package com.KOKUAirLine.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.model.Flight;

@Controller
public class ReservationCheckPriceController {

    @GetMapping("/reservationCheckPrice")
    public String mockReservationCheckPrice(
        @RequestParam(value = "departireAirport", required = false) String departure,
        @RequestParam(value = "arrivalAirport", required = false) String arrival,
        @RequestParam(value = "departureDate", required = false) String departureDate,
        @RequestParam(value = "returnDate", required = false) String returnDate,
        @RequestParam(value = "adultCount", required = false) Integer adultCount,
        @RequestParam(value = "childCount", required = false) Integer childCount,
        @RequestParam(value = "infantCount", required = false) Integer infantCount,
        @RequestParam(value = "tripType", required = false) String tripType,
        @RequestParam(value = "classType", required = false) String classType,
        Model model
    ) {
        // 기본값 설정
        if (departure == null) departure = "仁川";
        if (arrival == null) arrival = "沖縄";
        if (departureDate == null) departureDate = "25.06.09";
        if (returnDate == null) returnDate = "25.06.15";
        if (adultCount == null) adultCount = 2;
        if (childCount == null) childCount = 0;
        if (infantCount == null) infantCount = 0;
        if (tripType == null) tripType = "round";
        if (classType == null) classType = "eco-spec";

        String travelDate = departureDate + (tripType.equals("round") ? "-" + returnDate : "");
        int passengerCount = adultCount + childCount + infantCount;

        // 모의 항공편 리스트 생성
        List<Flight> flightList = new ArrayList<>();
        flightList.add(new Flight(
            1L, "OZ172", "A320", "08:50", "11:15",
            16200, 9, 20600, 9, 37000, 9
        ));
        flightList.add(new Flight(
            2L, "OZ173", "A320", "10:00", "13:05",
            13000, 15, 15000, 5, 32000, 4
        ));

        model.addAttribute("flightList", flightList);
        model.addAttribute("departure", departure);
        model.addAttribute("arrival", arrival);
        model.addAttribute("travelDate", travelDate);
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childCount", childCount);
        model.addAttribute("infantCount", infantCount);
        model.addAttribute("tripType", tripType);
        model.addAttribute("classType", classType);
        model.addAttribute("passengerCount", passengerCount);

        return "reservationCheckPrice"; // /WEB-INF/views/reservationCheckPrice.jsp
    }

    @PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
        @RequestParam("departireAirport") String departure,
        @RequestParam("arrivalAirport") String arrival,
        @RequestParam("departureDate") String departureDate,
        @RequestParam(value = "returnDate", required = false) String returnDate,
        @RequestParam("adultCount") int adultCount,
        @RequestParam("childCount") int childCount,
        @RequestParam("infantCount") int infantCount,
        @RequestParam("tripType") String tripType,
        @RequestParam("classType") String classType,
        RedirectAttributes attri
    ) {
        // travelDate 및 passengerCount 계산
        String travelDate = departureDate;
        if ("round".equals(tripType) && returnDate != null && !returnDate.isEmpty()) {
            travelDate += "-" + returnDate;
        }
        int passengerCount = adultCount + childCount + infantCount;

        // 쿼리 파라미터용 addAttribute
        attri.addAttribute("departireAirport", departure);
        attri.addAttribute("arrivalAirport", arrival);
        attri.addAttribute("departureDate", departureDate);
        attri.addAttribute("returnDate", returnDate);
        attri.addAttribute("adultCount", adultCount);
        attri.addAttribute("childCount", childCount);
        attri.addAttribute("infantCount", infantCount);
        attri.addAttribute("tripType", tripType);
        attri.addAttribute("classType", classType);

        // flash attribute (화면 출력용)
        attri.addFlashAttribute("departure", departure);
        attri.addFlashAttribute("arrival", arrival);
        attri.addFlashAttribute("tripType", tripType);
        attri.addFlashAttribute("travelDate", travelDate);
        attri.addFlashAttribute("passengerCount", passengerCount);

        return "redirect:/reservationCheckPrice";
    }
}

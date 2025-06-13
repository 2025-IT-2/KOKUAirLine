package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

<<<<<<< Updated upstream
import com.KOKUAirLine.project.model.Flight;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
public class ReservationCheckPriceController {

    @GetMapping("/reservationCheckPrice")
    public String mockReservationCheckPrice(@ModelAttribute("departure") String dep , HttpServletResponse resp, HttpServletRequest request) {

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

        request.setAttribute("flightList", flightList);
        request.setAttribute("departure", "仁川");
        request.setAttribute("arrival", "沖縄");
        request.setAttribute("travelDate", "25.06.09-25.06.15");
        request.setAttribute("passengerCount", 2);

        return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }

    @PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
        @RequestParam String departure,
        @RequestParam String arrival,
        @RequestParam String tripType,
        @RequestParam String travelDate,
        @RequestParam String passengerCount,
        RedirectAttributes attri
    ) {
        // 실제 구현 시 DB에서 flightList를 가져오는 서비스 호출 예정
=======
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
        // 기본값 처리
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
        model.addAttribute("departure", departure);
        model.addAttribute("arrival", arrival);
        model.addAttribute("travelDate", travelDate);
        model.addAttribute("adultCount", adultCount);
        model.addAttribute("childCount", childCount);
        model.addAttribute("infantCount", infantCount);
        model.addAttribute("tripType", tripType);
        model.addAttribute("classType", classType);
        return "reservationCheckPrice";
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
	    RedirectAttributes attri) {

	    attri.addAttribute("departireAirport", departure);
	    attri.addAttribute("arrivalAirport", arrival);
	    attri.addAttribute("departureDate", departureDate);
	    attri.addAttribute("returnDate", returnDate);
	    attri.addAttribute("adultCount", adultCount);
	    attri.addAttribute("childCount", childCount);
	    attri.addAttribute("infantCount", infantCount);
	    attri.addAttribute("tripType", tripType);
	    attri.addAttribute("classType", classType);
>>>>>>> Stashed changes

        // TODO: 추후 service로 대체
        List<Flight> flightList = new ArrayList<>();
        Flight mockFlight = new Flight(
            3L, "OZ999", "B737", "12:00", "14:30",
            15000, 5, 18000, 3, 25000, 2
        );
        flightList.add(mockFlight);

        attri.addFlashAttribute("departure", departure);
        attri.addFlashAttribute("arrival", arrival);
        attri.addFlashAttribute("tripType", tripType);
        attri.addFlashAttribute("travelDate", travelDate);
        attri.addFlashAttribute("passengerCount", passengerCount);

        return "redirect:/reservationCheckPrice";
    }
}

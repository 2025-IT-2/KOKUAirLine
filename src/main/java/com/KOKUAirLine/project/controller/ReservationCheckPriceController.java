package com.KOKUAirLine.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.KOKUAirLine.project.model.FlightTime;
import com.KOKUAirLine.project.model.ReservationRequest;
import com.KOKUAirLine.project.service.TempFlightService;

//import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
public class ReservationCheckPriceController {
	
	private final TempFlightService tempFlightService;
	
	public ReservationCheckPriceController(TempFlightService tempFlightService) {
        this.tempFlightService = tempFlightService;
    }

	@PostMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
            @ModelAttribute ReservationRequest requestForm,
            Model model
    ) {
        // 1. 임시 항공편 리스트 가져오기 (추후 DB 연동 예정)
        List<FlightTime> flightList = tempFlightService.getMockFlights();

        // 2. 뷰에 전달
        model.addAttribute("flightList", flightList);
        model.addAttribute("searchInfo", requestForm);

        return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }

    // 임시 확인용 GET (직접 접근 시 사용 가능)
    @GetMapping("/reservationCheckPrice")
    public String mockGetPage(Model model) {
        ReservationRequest dummyRequest = new ReservationRequest("왕복", "仁川", "沖縄", "25.06.09", "25.06.15", 2, 0, 0, "economi");
        List<FlightTime> flightList = tempFlightService.getMockFlights();

        model.addAttribute("searchInfo", dummyRequest);
        model.addAttribute("flightList", flightList);

        return "reservationCheckPrice";
    }
}

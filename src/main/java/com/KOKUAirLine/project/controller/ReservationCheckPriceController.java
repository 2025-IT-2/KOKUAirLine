package com.KOKUAirLine.project.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.model.Flight;

import jakarta.servlet.http.HttpServletResponse;

//import com.KOKUAirLine.project.service.FlightScheduleService;

@Controller
public class ReservationCheckPriceController {

	@GetMapping("/reservationCheckPrice")
	public String mockReservationCheckPrice(
	    @ModelAttribute("departireAirport") String departure,  // 오타까지 맞춰야 함
	    @ModelAttribute("arrivalAirport") String arrival,
	    @ModelAttribute("departureDate") String departureDate,
	    @ModelAttribute("returnDate") String returnDate,
	    @ModelAttribute("adultCount") Integer adultCount,
	    @ModelAttribute("childCount") Integer childCount,
	    @ModelAttribute("infantCount") Integer infantCount,
	    @ModelAttribute("tripType") String tripType,
	    @ModelAttribute("classType") String classType,
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

	    // 비행편 리스트 준비 (생략)

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
	    RedirectAttributes attri
	) {
	    String travelDate = departureDate + (tripType.equals("round") && returnDate != null && !returnDate.isEmpty() ? "-" + returnDate : "");

	    attri.addFlashAttribute("departireAirport", departure);
	    attri.addFlashAttribute("arrivalAirport", arrival);
	    attri.addFlashAttribute("travelDate", travelDate);
	    attri.addFlashAttribute("adultCount", adultCount);
	    attri.addFlashAttribute("childCount", childCount);
	    attri.addFlashAttribute("infantCount", infantCount);
	    attri.addFlashAttribute("tripType", tripType);
	    attri.addFlashAttribute("classType", classType);

	    return "redirect:/reservationCheckPrice";
	}
}

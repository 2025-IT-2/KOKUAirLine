package com.KOKUAirLine.project.controller;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.FlightWithPriceRate;
import com.KOKUAirLine.project.model.TicketPrice;
import com.KOKUAirLine.project.repo.TicketPriceRepo;
import com.KOKUAirLine.project.service.FlightService;
import com.KOKUAirLine.project.service.TicketPriceService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
public class ReservationCheckPriceController {
	
	@Autowired
	private  FlightService flightService;
	@Autowired
	public TicketPriceService ticketPriceService;

	@GetMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
//    	HttpServletRequest request,
//    	@RequestParam("departureAirport") String dep,
//    	@RequestParam("arrivalAirport") String arr,
//    	@RequestParam("departureDate") String dDateStr,
//    	@RequestParam("arrivalDate") String aDateStr,
//    	Model model) throws Exception {
//		
		
//		
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		Date dDate = formatter.parse(dDateStr);
//		Date aDate = formatter.parse(aDateStr);
//		
//		List<FlightInfo> flights = flightService.searchFlights(dep, arr, dDate, aDate);
//		model.addAttribute("flights", flights);
		
		@RequestParam("departureAirport") String dep,
	    @RequestParam("arrivalAirport") String arr,
	    @RequestParam("departureDate") String departureDate,
	    @RequestParam("arrivalDate") String arrivalDate,
	    @RequestParam(value = "departureTime", required = false) String departureTimeStr,
	    @RequestParam("classType") String classType,
	    @RequestParam("adultCount") int adultCount,
	    @RequestParam("childCount") int childCount,
	    @RequestParam("infantCount") int infantCount,
	    
	    HttpSession session,

	    Model model
	) throws Exception {
		
		if (adultCount <= 0) {
			return "redirect:/reservation";
		}
		
		if (classType.isEmpty()) {
			return "redirect:/reservation";
		}
		
		session.setAttribute("departureAirport", dep);
		
		
		System.out.println(dep + "\n" + arr + "\n" + departureDate
				+ "\n" + arrivalDate
				+ "\n" + departureTimeStr
				+ "\n" + classType
				+ "\n" + adultCount
				+ "\n" + adultCount);

	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
	    Date dDate = (departureDate != null && !departureDate.isEmpty()) ? formatter.parse(departureDate) : null;
	    Date aDate = null;
	    if (departureDate != null && !departureDate.isEmpty()) {
	        Date parsedDate = formatter.parse(departureDate);
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(parsedDate);
	        cal.set(Calendar.HOUR_OF_DAY, 23);
	        cal.set(Calendar.MINUTE, 59);
	        cal.set(Calendar.SECOND, 59);
	        cal.set(Calendar.MILLISECOND, 999);
	        aDate = cal.getTime();
	    }
	

//	    String airportDep = dep.substring(dep.lastIndexOf("/") + 2);
//	    String airportArr = arr.substring(arr.lastIndexOf("/") + 2);
	    
	    String airportDep = dep.substring(dep.lastIndexOf("/") + 2);
	    String airportArr = arr.substring(arr.lastIndexOf("/") + 2);
	    
	    List<FlightInfo> depFlights = flightService.searchFlights(airportDep, airportArr, dDate, aDate);

	    List<FlightWithPriceRate> flightsWithPrice = new ArrayList<>();

	    for (FlightInfo flight : depFlights) {
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(flight.getDepartureTime());
	        int hour = cal.get(Calendar.HOUR_OF_DAY);

	        float rate = (hour < 6 || hour >= 12) ? 0.8f : 1.0f;

	        FlightWithPriceRate flightData = new FlightWithPriceRate(flight, rate);
	        flightsWithPrice.add(flightData);
	    }

	    model.addAttribute("flightsWithPrice", flightsWithPrice);
	    
	    Date ddDate = (arrivalDate != null && !arrivalDate.isEmpty()) ? formatter.parse(arrivalDate) : null;
	    Date aaDate = null;
	    if (arrivalDate != null && !arrivalDate.isEmpty()) {
	    	Date parsedDate = formatter.parse(arrivalDate);
	    	Calendar cal = Calendar.getInstance();
	    	cal.setTime(parsedDate);
	    	cal.set(Calendar.HOUR_OF_DAY, 23);
	    	cal.set(Calendar.MINUTE, 59);
	    	cal.set(Calendar.SECOND, 59);
	    	cal.set(Calendar.MILLISECOND, 999);
	    	aDate = cal.getTime();
	    }
	    
	    
//	    String airportDep = dep.substring(dep.lastIndexOf("/") + 2);
//	    String airportArr = arr.substring(arr.lastIndexOf("/") + 2);
	    

	    
	    List<FlightInfo> arrFlights = flightService.searchFlights(airportArr, airportDep, dDate, aDate);
	    
	    List<FlightWithPriceRate> aflightsWithPrice = new ArrayList<>();

	    for (FlightInfo flight : arrFlights) {
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(flight.getDepartureTime());
	        int hour = cal.get(Calendar.HOUR_OF_DAY);

	        float rate = (hour < 6 || hour >= 12) ? 0.8f : 1.0f;

	        FlightWithPriceRate flightData = new FlightWithPriceRate(flight, rate);
	        aflightsWithPrice.add(flightData);
	    }

	    model.addAttribute("aflightsWithPrice", aflightsWithPrice);
	    
	    LocalTime departureTime;
	    if (departureTimeStr != null && !departureTimeStr.isEmpty()) {
	        departureTime = LocalTime.parse(departureTimeStr, DateTimeFormatter.ofPattern("HH:mm"));
	    } else {
	        // null 또는 빈 문자열일 때 기본값 설정 (예: 00:00) 또는 적절한 예외 처리
	        departureTime = LocalTime.of(0, 0);
	    }
//	    LocalTime departureTime = LocalTime.parse(departureTimeStr, DateTimeFormatter.ofPattern("HH:mm"));
	    String timeCategory = ticketPriceService.getTimeCategory(departureTime);

	    // 최종 가격 계산
	    
	    int saverPrice = ticketPriceService.calculateFinalPrice(
	    	    classType, adultCount, childCount, infantCount, timeCategory, "saver");
	    int standardPrice = ticketPriceService.calculateFinalPrice(
	    	    classType, adultCount, childCount, infantCount, timeCategory, "standard");
	    int flexPrice = ticketPriceService.calculateFinalPrice(
	    	    classType, adultCount, childCount, infantCount, timeCategory, "flex");

	    // 모델에 값 전달

	    model.addAttribute("adultCount", adultCount);
	    model.addAttribute("childCount", childCount);
	    model.addAttribute("infantCount", infantCount);
	    model.addAttribute("classType", classType);

	    model.addAttribute("timeCategory", timeCategory);
	    model.addAttribute("saverPrice", saverPrice);
	    model.addAttribute("standardPrice", standardPrice);
	    model.addAttribute("flexPrice", flexPrice);
	    
    	return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }
	
	

//	@PostMapping("/reservationCheckPrice")
//	public String reservationCheckPricePost(
//	    
//
//	    return "reservationCheckPrice";
//	}
    
}
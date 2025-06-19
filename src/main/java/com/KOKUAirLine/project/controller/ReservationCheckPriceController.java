package com.KOKUAirLine.project.controller;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.TicketPrice;
import com.KOKUAirLine.project.repo.TicketPriceRepo;
import com.KOKUAirLine.project.service.FlightService;
import com.KOKUAirLine.project.service.TicketPriceService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReservationCheckPriceController {
   
   @Autowired
   private  FlightService flightService;

   @GetMapping("/reservationCheckPrice")
    public String reservationCheckPrice(
       @RequestParam("departureAirport") String dep,
       @RequestParam("arrivalAirport") String arr,
       @RequestParam("departureDate") String dDateStr,
       @RequestParam("arrivalDate") String aDateStr,
       Model model) throws Exception {
      
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      Date dDate = formatter.parse(dDateStr);
      Date aDate = formatter.parse(aDateStr);
      
      List<FlightInfo> flights = flightService.searchFlights(dep, arr, dDate, aDate);
      model.addAttribute("flights", flights);
       return "reservationCheckPrice"; // => /WEB-INF/views/reservationCheckPrice.jsp
    }
   
   @Autowired
   private TicketPriceService ticketPriceService;

   @PostMapping("/reservationCheckPrice")
   public String reservationCheckPricePost(
       @RequestParam("departureAirport") String dep,
       @RequestParam("arrivalAirport") String arr,
       @RequestParam("departureDate") String departureDate,
       @RequestParam("arrivalDate") String arrivalDate,
       @RequestParam("departureTime") String departureTimeStr,
       @RequestParam("classType") String classType,
       @RequestParam("adultCount") int adultCount,
       @RequestParam("childCount") int childCount,
       @RequestParam("infantCount") int infantCount,
       @RequestParam("fareType") String fareType,          // 예: "saver"
       Model model
   ) throws Exception {

       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       Date dDate = (departureDate != null && !departureDate.isEmpty()) ? formatter.parse(departureDate) : null;
       Date aDate = (arrivalDate != null && !arrivalDate.isEmpty()) ? formatter.parse(arrivalDate) : null;

       List<FlightInfo> flights = flightService.searchFlights(dep, arr, dDate, aDate);
       model.addAttribute("flights", flights);
       
       LocalTime departureTime = LocalTime.parse(departureTimeStr, DateTimeFormatter.ofPattern("HH:mm"));
       String timeCategory = ticketPriceService.getTimeCategory(departureTime);

       // 최종 가격 계산
       int finalPrice = ticketPriceService.calculateFinalPrice(
           classType, adultCount, childCount, infantCount, timeCategory, fareType
       );
       int saverPrice = ticketPriceService.calculateFinalPrice(
              classType, adultCount, childCount, infantCount, timeCategory, "saver");
       int standardPrice = ticketPriceService.calculateFinalPrice(
              classType, adultCount, childCount, infantCount, timeCategory, "standard");
       int flexPrice = ticketPriceService.calculateFinalPrice(
              classType, adultCount, childCount, infantCount, timeCategory, "flex");

       // 모델에 값 전달
       model.addAttribute("totalPrice", finalPrice);
       model.addAttribute("adultCount", adultCount);
       model.addAttribute("childCount", childCount);
       model.addAttribute("infantCount", infantCount);
       model.addAttribute("classType", classType);
       model.addAttribute("fareType", fareType);
       model.addAttribute("timeCategory", timeCategory);
       model.addAttribute("saverPrice", saverPrice);
       model.addAttribute("standardPrice", standardPrice);
       model.addAttribute("flexPrice", flexPrice);

       return "reservationCheckPrice";
   }
    
}
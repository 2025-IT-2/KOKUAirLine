package com.KOKUAirLine.project.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.AirportRepository;
import com.KOKUAirLine.project.repo.FlightInfoRepository;

@Service
public class AirportService {
	
	@Autowired
	private AirportRepository airportRepository;
	
	@Autowired
	private FlightInfoRepository flightInfoRepository;
	
	public List<Map<String, String>> getAirportFlights() {
		
		List<AirportInfo> airports = airportRepository.findAll();
		List<FlightInfo> flights = flightInfoRepository.findAll();
		
		List<Map<String, String>> resultList = new ArrayList<>();
		
		Set<String> added = new HashSet<>();
		
		for (AirportInfo airport : airports) {
			
			for (FlightInfo flight : flights) {
				
				if (flight.getDeparture().equals(airport.getAirportCode())) {
					
					String name = airport.getAirportJp();
					String code = flight.getDeparture() + "-" + flight.getArrival();
					
					if (added.contains(name)) continue;
					if (added.contains(code)) continue;
					added.add(name);
					added.add(code);
					
					Map<String, String> map = new HashMap<String, String>();
					map.put("airportName", airport.getAirportJp());
					map.put("flightDepCode", flight.getDeparture());
					map.put("flightArrCode", flight.getArrival());
					resultList.add(map);
				}
				
			}
			
		}
		
		return resultList;
		
	}

//	public List<String> getAllowedDate() {
//		
//		List<Date> date = flightInfoRepository.searchAllowedDate();
//		List<String> dateToString = new ArrayList<>();
//		
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		for (Date d : date) {
//		    LocalDate localDate = d.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
//		    dateToString.add(localDate.format(formatter));
//		}
//		
//		return dateToString;
//	}
//
//	public List<Date> getAllowedDate2() {
//		
//		List<Date> date = flightInfoRepository.searchAllowedDate();
//		
//		return date;
//	}

	
}

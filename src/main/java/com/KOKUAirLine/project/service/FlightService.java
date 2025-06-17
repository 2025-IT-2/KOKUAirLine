package com.KOKUAirLine.project.service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class FlightService {
	
	@Autowired
	private FlightInfoRepository repo;
	
	public List<FlightInfo> searchFlights(String dep, String arr, Date dDate, Date aDate) {
		return repo.searchFlights(dep, arr, dDate, aDate);
	}
	
}

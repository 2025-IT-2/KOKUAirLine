package com.KOKUAirLine.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.FlightSchedule;
import com.KOKUAirLine.project.repo.FlightScheduleRepository;

@Service
public class FlightScheduleService {
	
	private final FlightScheduleRepository repository;

    public FlightScheduleService(FlightScheduleRepository repository) {
        this.repository = repository;
    }

    public List<FlightSchedule> findFlights(String departure, String arrival) {
        return repository.findByDepartureAndArrival(departure, arrival);
    }

}

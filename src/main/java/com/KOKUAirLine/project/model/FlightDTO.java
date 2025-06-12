package com.KOKUAirLine.project.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class FlightSchedule {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String departure;
    private String arrival;
    private String flightTime;

}

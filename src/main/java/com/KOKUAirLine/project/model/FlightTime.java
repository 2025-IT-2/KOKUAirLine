package com.KOKUAirLine.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlightTime {
	
	private Long id;
    private String flightNumber;
    private String aircraftType;
    private String departureTime;
    private String arrivalTime;
	
	
}


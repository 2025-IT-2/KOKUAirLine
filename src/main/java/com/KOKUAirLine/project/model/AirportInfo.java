package com.KOKUAirLine.project.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AirportInfo {
	
	@Id
	private String airportCode;
	private String airportKr;
	private String airportJp;
	
}

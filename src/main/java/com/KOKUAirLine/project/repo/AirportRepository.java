package com.KOKUAirLine.project.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.KOKUAirLine.project.model.AirportInfo;

public interface AirportRepository extends JpaRepository<AirportInfo, String>{

	Optional<AirportInfo> findByAirportCode(String airportCode);
	
}

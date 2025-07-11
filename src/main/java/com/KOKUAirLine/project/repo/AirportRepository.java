package com.KOKUAirLine.project.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.AirportInfo;
import com.KOKUAirLine.project.service.AirportService;

@Repository
public interface AirportRepository extends JpaRepository<AirportInfo, String>{
	
	@Query("SELECT a FROM AirportInfo a WHERE "
			+ "a.airportCode = :airportcode AND "
			+ "a.airportKr = :airportKr AND "
			+ "a.airportJp = :airportJp")
	AirportInfo searchAirportCode	(@Param("airportCode") String airportCode,
            					 	@Param("airportKr") String airportKr,
            					 	@Param("airportJp") String airportJp);
	
	@Query("SELECT a FROM AirportInfo a WHERE "
			+ "a.airportCode = :airportcode")
	AirportInfo searchAirpoCodebyId(String airportCode);
	
	Optional<AirportInfo> findByAirportCode(String airportCode);
	
}

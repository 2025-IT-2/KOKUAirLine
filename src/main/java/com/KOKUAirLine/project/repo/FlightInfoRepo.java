package com.KOKUAirLine.project.repo;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.FlightInfo;


@Repository
public interface FlightInfoRepo extends JpaRepository<FlightInfo, String> {
	@Query("SELECT f FROM FlightInfo f WHERE "
			+ "f.departure = :dep AND f.arrival = :arr AND "
			+ "f.departureDate = :dDate AND f.arrivalDate = :aDate")
	List<FlightInfo> searchFlights(String dep, String arr, Date dDate, Date aDate);
}


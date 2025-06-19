package com.KOKUAirLine.project.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.TicketPrice;

@Repository
public interface TicketPriceRepo extends JpaRepository<TicketPrice, String>{
	
	Optional<TicketPrice> findByPriceName(String priceName);

}

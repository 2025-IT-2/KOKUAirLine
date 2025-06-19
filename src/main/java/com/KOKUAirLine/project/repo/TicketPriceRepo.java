package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.TicketPrice;

@Repository
public interface TicketPriceRepo extends JpaRepository<TicketPrice, String>{

}

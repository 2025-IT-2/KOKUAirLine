package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.model.UserInfo;

@Repository
public interface FlightInfoRepo extends JpaRepository<FlightInfo, String> {
}


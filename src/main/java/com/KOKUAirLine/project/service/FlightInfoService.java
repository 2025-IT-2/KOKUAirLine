package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepo;

@Service // 비즈니스 로직 처리 서비스 계층
public class FlightInfoService {

	@Autowired
    private FlightInfoRepo repository;

    // 특정 항공편 번호에 대한 데이터 조회
    public FlightInfo getFlightById(String flightNo) {
        return repository.findById(flightNo).orElse(null);
    }
}

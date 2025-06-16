package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repo.FlightInfoRepository;

@Service // 비즈니스 로직 처리 서비스 계층
public class FlightInfoService {

	@Autowired
    private FlightInfoRepository repository;
//	private FlightInfoRepo repository;

    // 특정 항공편 번호에 대한 데이터 조회
    public FlightInfo getFlightById(String flightNo) {
         return repository.findById(flightNo).orElse(null);
    }
    
 // 또는 Optional로 반환할 수도 있음
    // public Optional<FlightInfo> getFlightById(String flightNo) {
    //     return repository.findById(flightNo);
    // }
}

package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.KOKUAirLine.project.model.PassportInfo;

public interface PassportInfoRepository extends JpaRepository<PassportInfo, String> {
	
	
	
}

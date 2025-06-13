package com.KOKUAirLine.project.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor // 파라미터가 다 있거나 다 없는 생성자 2가지 생성됨
public class InFlightMeal { // 기내식 정보 저장 클래스
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reservation_seq")
    @SequenceGenerator(name = "reservation_seq", sequenceName = "RESERVATION_SEQ", allocationSize = 1)
	private int mealNo;
	
	private String FlightMeal;
	
	public InFlightMeal(String flightMeal) {
	    this.FlightMeal = flightMeal;
	}

}

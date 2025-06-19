package com.KOKUAirLine.project.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PassportInfo {
	
	@Id
	private String passportNumber;
	
	private String EngLastName;
	private String EngFirstName;
	private String nationality;
	
	private LocalDate dateOfBirth;
	private String gender;
	
	private LocalDate expiredDate;
	
	private String issuingCountry;

}

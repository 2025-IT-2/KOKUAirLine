package com.KOKUAirLine.project.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "TicketPrice")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketPrice {
	
	@Id
	private String priceName;
	
	private int priceDetail;

}
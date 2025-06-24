package com.KOKUAirLine.project.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PaymentInfo")
@Data
@AllArgsConstructor
@NoArgsConstructor 
public class PaymentInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "payment_seq_gen")
	@SequenceGenerator(name = "payment_seq_gen", sequenceName = "PAYMENT_SEQ", allocationSize = 1)
	@Column(name = "PAYMENT_ID")  // 대소문자 및 언더스코어 정확히 맞추기
	private Long paymentId;				// 결제ID 
    
    @ManyToOne
    @JoinColumn(name = "RESINUM")
    private Reservation reservation;
	
	@ManyToOne
	@JoinColumn(name = "FLIGHTMEAL")
	private InFlightMeal FlightMeal;	//기내식
	
	@Column(name = "AIRFARE")	
	private Integer airFare; 			//항공요금 
	
	@Column(name = "FUELSURCHARGE")	
	private Integer fuelSurcharge; 		//유류할증료 	

	@Column(name = "TAXCHARGE")	
	private Integer taxCharge; 			//제세공과금
	
	@Column(name = "SERVICECHARGE")	
	private Integer serviceCharge; 		//발권수수료

	@Column(name = "TRAVELERINSUR")	
	private Integer travelerInsur; 		//여행자보험
	
	@Column(name = "TOTALFARE")	
	private Integer totalFare; 			//총액운임
	
	@Column(name = "PAYMENTSTAT")	
	private Integer paymentStat; 		//결제상태
	
}

package com.KOKUAirLine.project.model;

import lombok.Data;

@Data
public class ReservationRequest {
	
	private String tripType;
    private String departireAirport; // 오타 그대로 유지
    private String arrivalAirport;
    private String departureDate;
    private String returnDate;
    private int adultCount;
    private int childCount;
    private int infantCount;
    private String classType;
	
	 public ReservationRequest(String tripType, String departireAirport, String arrivalAirport, String departureDate, String returnDate, int adultCount, int childCount, int infantCount, String classType) {
		    this.tripType = tripType;
	        this.departireAirport = departireAirport;
	        this.arrivalAirport = arrivalAirport;
	        this.departureDate = departureDate;
	        this.returnDate = returnDate;
	        this.adultCount = adultCount;
	        this.childCount = childCount;
	        this.infantCount = infantCount;
	        this.classType = classType;
	        
	}
	

}

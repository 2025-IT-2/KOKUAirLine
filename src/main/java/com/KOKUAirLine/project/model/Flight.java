package com.KOKUAirLine.project.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String flightNumber;
    private String aircraftType;
    private String departureTime;
    private String arrivalTime;

    private int saverPrice;
    private int saverSeats;
    private int standardPrice;
    private int standardSeats;
    private int flexPrice;
    private int flexSeats;

    // ✅ 생성자 추가
    public Flight(Long id, String flightNumber, String aircraftType, String departureTime, String arrivalTime,
                  int saverPrice, int saverSeats,
                  int standardPrice, int standardSeats,
                  int flexPrice, int flexSeats) {
        this.id = id;
        this.flightNumber = flightNumber;
        this.aircraftType = aircraftType;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.saverPrice = saverPrice;
        this.saverSeats = saverSeats;
        this.standardPrice = standardPrice;
        this.standardSeats = standardSeats;
        this.flexPrice = flexPrice;
        this.flexSeats = flexSeats;
    }

    // ✅ getter
    public Long getId() { return id; }
    public String getFlightNumber() { return flightNumber; }
    public String getAircraftType() { return aircraftType; }
    public String getDepartureTime() { return departureTime; }
    public String getArrivalTime() { return arrivalTime; }
    public int getSaverPrice() { return saverPrice; }
    public int getSaverSeats() { return saverSeats; }
    public int getStandardPrice() { return standardPrice; }
    public int getStandardSeats() { return standardSeats; }
    public int getFlexPrice() { return flexPrice; }
    public int getFlexSeats() { return flexSeats; }
}

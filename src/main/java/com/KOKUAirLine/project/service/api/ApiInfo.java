package com.KOKUAirLine.project.service.api;

import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName = "item")
public class ApiInfo {
    private String aircraftRegNo;
    private String aircraftSubtype;
    private String airline;
    private String airport;
    private String depTime;
    private String airportCode;
    private String chkinRange;
    private String codeshare;
    private String estimatedDatetime;
    private String fid;
    private String flightId;
    private String fstandPosition;
    private String arrTime;
    private String gateNumber;
    private String masterFlightId;
    private String passengerOrCargo;
    private String remark;
    private String scheduleDatetime;
    private String terminalId;
    private String typeOfFlight;
    @JsonIgnoreProperties(ignoreUnknown = true)
    private String airportJp;
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ApiInfo)) return false;
        ApiInfo other = (ApiInfo) o;
        return Objects.equals(airport, other.airport);
    }

    @Override
    public int hashCode() {
        return Objects.hash(airport);
    }
    
//    public String AircraftRegNo() {
//        return aircraftRegNo;
//    }
//
//    public void setDepAirport(String aircraftRegNo) {
//        this.aircraftRegNo = aircraftRegNo;
//    }
}
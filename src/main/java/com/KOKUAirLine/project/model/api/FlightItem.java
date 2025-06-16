package com.KOKUAirLine.project.model.api;

import jakarta.xml.bind.annotation.XmlElement;

public class FlightItem {

    private String aircraftRegNo;
    private String aircraftSubtype;
    private String airline;
    private String airport;
    private String airportCode;
    private String chkinRange;
    private String codeshare;
    private String estimatedDatetime;
    private String fid;
    private String flightId;
    private String fstandPosition;
    private String gateNumber;
    private String masterFlightId;
    private String passengerOrCargo;
    private String remark;
    private String scheduleDatetime;
    private String terminalId;
    private String typeOfFlight;

    @XmlElement
    public String getAircraftRegNo() {
        return aircraftRegNo;
    }

    public void setAircraftRegNo(String aircraftRegNo) {
        this.aircraftRegNo = aircraftRegNo;
    }

    @XmlElement
    public String getAircraftSubtype() {
        return aircraftSubtype;
    }

    public void setAircraftSubtype(String aircraftSubtype) {
        this.aircraftSubtype = aircraftSubtype;
    }

    @XmlElement
    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    @XmlElement
    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    @XmlElement
    public String getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(String airportCode) {
        this.airportCode = airportCode;
    }

    @XmlElement
    public String getChkinRange() {
        return chkinRange;
    }

    public void setChkinRange(String chkinRange) {
        this.chkinRange = chkinRange;
    }

    @XmlElement
    public String getCodeshare() {
        return codeshare;
    }

    public void setCodeshare(String codeshare) {
        this.codeshare = codeshare;
    }

    @XmlElement
    public String getEstimatedDatetime() {
        return estimatedDatetime;
    }

    public void setEstimatedDatetime(String estimatedDatetime) {
        this.estimatedDatetime = estimatedDatetime;
    }

    @XmlElement
    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    @XmlElement
    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
    }

    @XmlElement
    public String getFstandPosition() {
        return fstandPosition;
    }

    public void setFstandPosition(String fstandPosition) {
        this.fstandPosition = fstandPosition;
    }

    @XmlElement
    public String getGateNumber() {
        return gateNumber;
    }

    public void setGateNumber(String gateNumber) {
        this.gateNumber = gateNumber;
    }

    @XmlElement
    public String getMasterFlightId() {
        return masterFlightId;
    }

    public void setMasterFlightId(String masterFlightId) {
        this.masterFlightId = masterFlightId;
    }

    @XmlElement
    public String getPassengerOrCargo() {
        return passengerOrCargo;
    }

    public void setPassengerOrCargo(String passengerOrCargo) {
        this.passengerOrCargo = passengerOrCargo;
    }

    @XmlElement
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @XmlElement
    public String getScheduleDatetime() {
        return scheduleDatetime;
    }

    public void setScheduleDatetime(String scheduleDatetime) {
        this.scheduleDatetime = scheduleDatetime;
    }

    @XmlElement
    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId;
    }

    @XmlElement
    public String getTypeOfFlight() {
        return typeOfFlight;
    }

    public void setTypeOfFlight(String typeOfFlight) {
        this.typeOfFlight = typeOfFlight;
    }
}

package com.KOKUAirLine.project.model;

import lombok.Data;

@Data
public class FlightWithPriceRate {
    private FlightInfo flight;
    private float price;

    public FlightWithPriceRate(FlightInfo flight, float price) {
        this.flight = flight;
        this.price = price;
    }
}


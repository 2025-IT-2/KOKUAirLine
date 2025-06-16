package com.KOKUAirLine.project.service;

import com.KOKUAirLine.project.model.FlightTime;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TempFlightService {

    public List<FlightTime> getMockFlights() {
        List<FlightTime> flightList = new ArrayList<>();

        flightList.add(new FlightTime(
                1L, "OZ172", "A320", "08:50", "11:15"
                
        ));

        flightList.add(new FlightTime(
                2L, "OZ999", "B737", "12:00", "14:30"
                
        ));

        return flightList;
    }
}

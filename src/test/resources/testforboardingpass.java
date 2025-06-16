package com.KOKUAirLine.project.config;

import com.KOKUAirLine.project.model.FlightInfo;
import com.KOKUAirLine.project.repository.FlightInfoRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.text.SimpleDateFormat;

@Configuration
public class testforboardingpass {

    @Bean
    public CommandLineRunner initData(FlightInfoRepository repository) {
        return args -> {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

            FlightInfo flight = new FlightInfo(
                "KE123", // flightNo
                "비빔밥", // FlightMeal
                "ICN", // departure
                dateFormat.parse("2025-07-01 00:00"), // departureDate
                dateFormat.parse("2025-07-01 08:30"), // departureTime
                1, // departureTerminal
                "NRT", // arrival
                dateFormat.parse("2025-07-01 00:00"), // arrivalDate
                dateFormat.parse("2025-07-01 11:00"), // arrivalTime
                2, // arrivalTerminal
                45, // SeatRemain
                180 // SeatTotal
            );

            repository.save(flight);
        };
    }
}

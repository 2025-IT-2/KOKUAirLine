package com.KOKUAirLine.project.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "FlightInfo")
@Data
@AllArgsConstructor
@NoArgsConstructor // 파라미터가 다 있거나 다 없는 생성자 2가지 생성됨

//@Entity
//@Table("flight_info")
public class FlightInfo {
//static class FlightInfo {

    @Id 
//    @Column(name = "FLIGHTNO")
    private String flightNo; //운항코드

//    @Column(name = "FLIGHTMEAL")
    private String FlightMeal; //기내식

//    @Column(name = "DEPARTURE")
    private String departure; //출발지

//    @Column(name = "DEPARTUREDATE")
    private Date departureDate; //출발 날짜

//    @Column(name = "DEPARTURETIME")
    private Date departureTime; //출발 시간 

//    @Column(name = "DEPARTURETERMINAL")
    private Integer departureTerminal; //출발 터미널

//    @Column(name = "ARRIVAL")
    private String arrival; //도착지 (이름)

//    @Column(name = "ARRIVALDATE")
    private Date arrivalDate; // 도착 날짜

//    @Column(name = "ARRIVALTIME")
    private Date arrivalTime; //도착 시간

//    @Column(name = "ARRIVALTERMINAL")
    private Integer arrivalTerminal; //도착 터미널
    
    private Integer SeatRemain; //남은 좌석수
    
    private Integer SeatTotal; //전체 좌석수

    // Getters and Setters 생략 가능 (Lombok @Data 사용 가능)
}

package com.KOKUAirLine.project.model;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PassportInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long passport_ID;  // 여권정보 고유 ID (기본키)

    // 예약 테이블과 다대일 관계
    @ManyToOne
    @JoinColumn(name = "RESINUM")
    private Reservation reservation;

    private String passportNumber;

    private String EngLastName;
    private String EngFirstName;
    private String nationality;

    private LocalDate dateOfBirth;
    private String gender;

    private LocalDate expiredDate;

    private String issuingCountry;
}

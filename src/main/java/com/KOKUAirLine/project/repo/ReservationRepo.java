package com.KOKUAirLine.project.repo;

import com.KOKUAirLine.project.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ReservationRepo extends JpaRepository<Reservation, Long> {

    // 1. 예약 번호 상세 조회 (항공편 + 기내식 즉시 로딩)
    @Query("SELECT r FROM Reservation r " +
           "JOIN FETCH r.flightInfo f " +
           "JOIN FETCH f.FlightMeal m " +
           "WHERE r.resiNum = :resiNum")
    Optional<Reservation> findDetailByResiNum(Integer resiNum);	
	
    // 2. 항공편 번호로 예약 조회
    List<Reservation> findByFlightInfo_FlightNo(String flightNo);

    // 3. 예약일자 기준으로 조회
    List<Reservation> findByResDate(LocalDate resDate);
   
    // 4. 예약 목록 전체 조회 (항공편 + 기내식 즉시 로딩)
    @Query("SELECT r FROM Reservation r " +
           "JOIN FETCH r.flightInfo f " +
           "JOIN FETCH f.FlightMeal m")
    List<Reservation> findAllWithFlightAndMeal();

}

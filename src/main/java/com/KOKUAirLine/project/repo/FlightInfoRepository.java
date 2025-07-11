package com.KOKUAirLine.project.repo;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.FlightInfo;

//@Repository
//public interface FlightInfoRepo extends JpaRepository<FlightInfo, String> {
////	@Query("SELECT f.departure, f.departureTime, f.arrival, f.arrivalTime FROM FlightInfo f WHERE f.flightNo = :flightNo")
////	Object[] findFlightFieldsByFlightNo( String flightNo);
//
//				
//}

@Repository
public
interface FlightInfoRepository extends JpaRepository<FlightInfo, String> {

	@Query("SELECT f FROM FlightInfo f WHERE f.flightNo = :flightNo")
//    FlightInfo findSummaryByFlightNo( String flight_No);
    Optional<FlightInfo> findFlightInfoByFlightNo(String flightNo);
	
	@Query("SELECT f FROM FlightInfo f WHERE f.departure = :dep AND f.arrival = :arr AND f.departureDate BETWEEN :dDate AND :aDate")
	List<FlightInfo> searchFlights(String dep, String arr, Date dDate, Date aDate);
	
	@Query("SELECT f.departureDate FROM FlightInfo f")
	List<Date> searchAllowedDate();

	Optional<FlightInfo> findByFlightNo(String flightNo);	
	
}


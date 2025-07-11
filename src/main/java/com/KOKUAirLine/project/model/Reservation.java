package com.KOKUAirLine.project.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import java.time.LocalDate;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Reservation")
@Data
@AllArgsConstructor
@NoArgsConstructor 
public class Reservation {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "RESINUM")	
	private Long resiNum; 		//예약번호
	
	@ManyToOne
	@JoinColumn(name = "FLIGHTNO") 	// Reservation 테이블의 외래키 컬럼명
	private FlightInfo flightInfo;	//항공편명
    
	@ManyToOne
	@JoinColumn(name = "userId")
	private UserInfo reservationHolder; // 예약자 대표 (ID 기준)
	
	@Column(name = "RESNUML")	
	private Integer resNumL; 		//성인인원
	
	@Column(name = "RESNUMM")	
	private Integer resNumM; 		//소아인원 
	
	@Column(name = "RESNUMS")	
	private Integer resNumS; 		//유아인원
	
	@Column(name = "RESDATE")	
	private LocalDate resDate;    	// 예매일자
	
	@Column(name = "FLIGHTMEALYN")	
	private String flightMealYN;	// 기내식신청여부

	@Column(name = "CLASSTYPE")
	private String classType; // 좌석 등급

	@Column(name = "CANCELSTEP")
	@Enumerated(EnumType.STRING)
	private CancelStatus cancelStep;		// 취소진행상태
	
	public enum CancelStatus {
		予約完了, 払い戻し要請, 払い戻し完了
//	    예약완료, 취소요청, 취소완료
	}	
	
    // Getters and Setters 생략 가능 (Lombok @Data 사용 가능)	
}

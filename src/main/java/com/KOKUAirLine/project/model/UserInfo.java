package com.KOKUAirLine.project.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo { // 유저 데이터 저장용 클래스. 이거에 맞는 테이블 생성됨
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String email;
	private String userId;
	private String password;
	
	private String userLastName;
	private String userFirstName;
	
	private LocalDate birthDate;
	private boolean gender;
	
	private String national;
	private int userPhone;
	private LocalDateTime createDate;
}

package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.UserInfo;

@Repository
public interface UserInfoRepo extends JpaRepository<UserInfo, String> {
	@Query("SELECT u FROM UserInfo u WHERE "
			+ "u.userId = :id AND "
			+ "u.password = :pw")
	UserInfo searchUser(String id, String pw);
	
	@Query("SELECT u FROM UserInfo u WHERE "
			+ "u.userId = :id")
	UserInfo searchUserById(String id);

	//아이디 비번 찾기 (시도중)
	@Query("SELECT u FROM UserInfo u WHERE u.userLastName = :lastName AND u.userFirstName = :firstName AND u.userPhone = :phone")
	UserInfo findByNameAndPhone(String lastName, String firstName, String phone);

}

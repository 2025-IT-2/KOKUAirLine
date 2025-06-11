package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.KOKUAirLine.project.model.UserInfo;

public interface UserInfoRepo extends JpaRepository<UserInfo, Integer> {

}

package com.KOKUAirLine.project;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.transaction.Transactional;

// 테스트 코드. User 테스트용 데이터 1개 추가 코드.
@SpringBootTest
@Transactional
@Rollback(false)
class UserInfoTest {

    @Autowired
    private UserInfoRepo userInfoRepository;

    @Test
    void saveTestUser() {
        UserInfo user = new UserInfo(
			"testUser2",
			"pass456",
			"test2@example.com",
			"Lee",
			"Jisoo",
			LocalDate.of(1990, 8, 20),
			false,
			"Korea",
			1098765432,
			LocalDateTime.now()
        );

        userInfoRepository.save(user);
        System.out.println(userInfoRepository.searchUser("testUser2", "pass456"));
    }
}

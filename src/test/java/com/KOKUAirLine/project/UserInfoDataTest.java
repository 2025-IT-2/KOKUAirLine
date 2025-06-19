package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

@SpringBootTest
public class UserInfoDataTest {

    @Autowired
    private UserInfoRepo userInfoRepo;

    @BeforeEach
    void setUp() {
        userInfoRepo.deleteAll();

        UserInfo user1 = new UserInfo(
            "testuser1",
            "1234",
            "test1@example.com",
            "田中",
            "太郎",
            LocalDate.of(1995, 5, 15),
            true,
            "日本",
            "010-1234-5678",
            LocalDateTime.now()
        );

        UserInfo user2 = new UserInfo(
            "testuser2",
            "abcd",
            "test2@example.com",
            "李",
            "美花",
            LocalDate.of(1990, 10, 30),
            false,
            "韓国",
            "010-2345-6789",
            LocalDateTime.now()
        );

        userInfoRepo.save(user1);
        userInfoRepo.save(user2);
    }

    @Test
    void testSearchUser() {
        UserInfo found = userInfoRepo.searchUser("testuser1", "1234");
        assertNotNull(found);
        assertEquals("test1@example.com", found.getEmail());
    }

    @Test
    void testSearchUserFail() {
        UserInfo found = userInfoRepo.searchUser("testuser1", "wrongpassword");
        assertNull(found);
    }

    @Test
    void testSearchUserById() {
        UserInfo found = userInfoRepo.searchUserById("testuser2");
        assertNotNull(found);
        assertEquals("美花", found.getUserFirstName());
    }
}

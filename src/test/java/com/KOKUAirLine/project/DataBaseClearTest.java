package com.KOKUAirLine.project;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DataBaseClearTest {

    @PersistenceContext
    private EntityManager em;

    @Test
    @Transactional
    public void clearDatabase() {
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE PaymentInfo CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE Reservation CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE FlightInfo CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE UserInfo CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE InFlightMeal CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();

        System.out.println("✅ 모든 테이블 삭제 완료");
    }
}

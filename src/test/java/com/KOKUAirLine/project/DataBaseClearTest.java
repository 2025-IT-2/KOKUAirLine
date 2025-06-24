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
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE Payment_Info CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE Reservation CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE Flight_Info CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE User_Info CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();
        em.createNativeQuery("BEGIN EXECUTE IMMEDIATE 'DROP TABLE In_Flight_Meal CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;").executeUpdate();

        System.out.println("✅ 모든 테이블 삭제 완료");
    }
}

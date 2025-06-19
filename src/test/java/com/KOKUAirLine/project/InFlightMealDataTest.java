package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.InFlightMeal;
import com.KOKUAirLine.project.repo.InFlightMealRepository;

@SpringBootTest
public class InFlightMealDataTest {

    @Autowired
    InFlightMealRepository inFlightMealRepo;

    @BeforeEach
    void setUp() {
        inFlightMealRepo.deleteAll();
        inFlightMealRepo.save(new InFlightMeal("チキンライス"));
        inFlightMealRepo.save(new InFlightMeal("ビーフステーキ"));
    }

    @Test
    void testInFlightMealSaved() {
        List<InFlightMeal> meals = inFlightMealRepo.findAll();
        assertEquals(2, meals.size());
    }
}

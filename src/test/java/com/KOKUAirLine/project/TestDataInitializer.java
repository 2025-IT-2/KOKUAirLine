package com.KOKUAirLine.project;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import com.KOKUAirLine.project.model.InFlightMeal;
import com.KOKUAirLine.project.model.TaxFreeItem;
import com.KOKUAirLine.project.repo.InFlightMealRepository;
import com.KOKUAirLine.project.repo.TaxFreeItemRepo;

@SpringBootTest
public class TestDataInitializer {
	@Autowired
    InFlightMealRepository flightMealRepo;
	
	@Autowired
	TaxFreeItemRepo textFreeRepo;
	
	public static byte[] readImageAsBytes(String resourcePath) {
	    try {
	        return Files.readAllBytes(new File(
	            TestDataInitializer.class.getResource(resourcePath).toURI()
	        ).toPath());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}


    @BeforeEach
    void setUp() {
    	flightMealRepo.deleteAll();
        textFreeRepo.deleteAll();
        
    	flightMealRepo.save(new InFlightMeal("야채식"));
        flightMealRepo.save(new InFlightMeal("저지방식"));
        
        textFreeRepo.save(new TaxFreeItem("건강 식품", readImageAsBytes("/static/img/HealthFood.png"), 100000));
        textFreeRepo.save(new TaxFreeItem("화장품", readImageAsBytes("/static/img/Cosmetics.png"), 200000));
        textFreeRepo.save(new TaxFreeItem("와인", readImageAsBytes("/static/img/Wine.png"), 990000));
    }
    
    @Test
    void main() {
    	System.out.println(flightMealRepo.searchMeal(1) + "\n" + flightMealRepo.searchMeal(2));
    }
    
    @Test
    void testTaxFreeItemSaved() {
        List<TaxFreeItem> items = textFreeRepo.findAll();
        assertEquals(3, items.size());
        assertEquals("건강 식품", items.get(0).getProduct_name());
    }

}

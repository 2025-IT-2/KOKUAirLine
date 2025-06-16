package com.KOKUAirLine.project;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ContextConfiguration;

import com.KOKUAirLine.project.model.InFlightMeal;
import com.KOKUAirLine.project.model.TaxFreeItem;
import com.KOKUAirLine.project.repo.InFlightMealRepository;
import com.KOKUAirLine.project.repo.TaxFreeItemRepo;

@SpringBootTest
public class TaxFreeItemDataTest {
	@Autowired
    InFlightMealRepository flightMealRepo;
	
	@Autowired
	TaxFreeItemRepo textFreeRepo;
	
	public static byte[] readImageAsBytes(String filePath) {
	    byte[] byteFile = null;
	    
		try {
			byteFile = Files.readAllBytes(new File(filePath).toPath());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	    return byteFile;
	}


    @BeforeEach
    void setUp() {
        textFreeRepo.deleteAll();
        textFreeRepo.save(new TaxFreeItem("건강 식품", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/HealthFood.png"), 100000));
        textFreeRepo.save(new TaxFreeItem("화장품", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Cosmetics.png"), 200000));
        textFreeRepo.save(new TaxFreeItem("와인", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Wine.png"), 990000));
    }
    
    @Test
    void testTaxFreeItemSaved() {
    	List<TaxFreeItem> items = textFreeRepo.findAll();
    	List<String> names = items.stream().map(TaxFreeItem::getName).toList();

    	assertEquals(3, names.size());
    	assertTrue(names.contains("건강 식품"));
    	assertTrue(names.contains("화장품"));
    	assertTrue(names.contains("와인"));
    }

}

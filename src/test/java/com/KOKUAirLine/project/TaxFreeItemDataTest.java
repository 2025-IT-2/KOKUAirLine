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
import com.KOKUAirLine.project.model.TicketPrice;
import com.KOKUAirLine.project.repo.InFlightMealRepository;
import com.KOKUAirLine.project.repo.TaxFreeItemRepo;
import com.KOKUAirLine.project.repo.TicketPriceRepo;

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
        textFreeRepo.save(new TaxFreeItem("健康食品", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/HealthFood.png"),
        		"健康に本当にいいのに何と説明する方法がないね", 100000));
        textFreeRepo.save(new TaxFreeItem("化粧品", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Cosmetics.png"), 
        		"絶対落ちない化粧品！", 200000));
        textFreeRepo.save(new TaxFreeItem("ワイン", readImageAsBytes("C:/Users/USER/Documents/GitHub/KOKUAirLine/src/main/resources/static/img/Wine.png"),
        		"5000年産のワイン", 990000));
    }
    
    @Test
    void testTaxFreeItemSaved() {
    	List<TaxFreeItem> items = textFreeRepo.findAll();
    	List<String> names = items.stream().map(TaxFreeItem::getName).toList();

    	assertEquals(3, names.size());
    	assertTrue(names.contains("健康食品"));
    	assertTrue(names.contains("化粧品"));
    	assertTrue(names.contains("ワイン"));
    }

}

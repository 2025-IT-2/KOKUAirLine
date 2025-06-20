package com.KOKUAirLine.project;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.TicketPrice;
import com.KOKUAirLine.project.repo.TicketPriceRepo;

@SpringBootTest
public class PriceDataTest {

    @Autowired
    TicketPriceRepo ticketPriceRepo;

    @BeforeEach
    void setUp() {
        ticketPriceRepo.deleteAll();
		
		ticketPriceRepo.save(new TicketPrice("eco-spec", 15000));
		ticketPriceRepo.save(new TicketPrice("eco-norm", 18000));
		ticketPriceRepo.save(new TicketPrice("buis", 36000));
		ticketPriceRepo.save(new TicketPrice("first", 75000));
		
		ticketPriceRepo.save(new TicketPrice("saver", 0));
		ticketPriceRepo.save(new TicketPrice("standard", 3000));
		ticketPriceRepo.save(new TicketPrice("flex", 8000));
		
		ticketPriceRepo.save(new TicketPrice("adult", 100));
		ticketPriceRepo.save(new TicketPrice("child", 50));
		ticketPriceRepo.save(new TicketPrice("infant", 30));
		
		ticketPriceRepo.save(new TicketPrice("dawn", 80));
		ticketPriceRepo.save(new TicketPrice("morning", 100));
		ticketPriceRepo.save(new TicketPrice("afternoon", 80));
    }

    @Test
    void testTicketPriceDataSaved() {
//        List<TicketPrice> prices = ticketPriceRepo.findAll();
//        assertEquals(9, prices.size());
//
//        List<String> names = prices.stream().map(TicketPrice::getPriceName).toList();
//        assertTrue(names.contains("saver"));
//        assertTrue(names.contains("adult"));
//        assertTrue(names.contains("morning"));
    }
}

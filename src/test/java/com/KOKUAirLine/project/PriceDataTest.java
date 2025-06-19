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

        ticketPriceRepo.save(new TicketPrice("saver", 16000));
        ticketPriceRepo.save(new TicketPrice("standard", 20600));
        ticketPriceRepo.save(new TicketPrice("flex", 37000));
        ticketPriceRepo.save(new TicketPrice("adult", 100));
        ticketPriceRepo.save(new TicketPrice("child", 50));
        ticketPriceRepo.save(new TicketPrice("infant", 30));
        ticketPriceRepo.save(new TicketPrice("dawn", 80));
        ticketPriceRepo.save(new TicketPrice("morning", 100));
        ticketPriceRepo.save(new TicketPrice("afternoon", 80));
    }

    @Test
    void testTicketPriceDataSaved() {
        List<TicketPrice> prices = ticketPriceRepo.findAll();
        assertEquals(9, prices.size());

        List<String> names = prices.stream().map(TicketPrice::getPriceName).toList();
        assertTrue(names.contains("saver"));
        assertTrue(names.contains("adult"));
        assertTrue(names.contains("morning"));
    }
}

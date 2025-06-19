package com.KOKUAirLine.project.service;

import java.time.LocalTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.TicketPrice;
import com.KOKUAirLine.project.repo.TicketPriceRepo;

@Service
public class TicketPriceService {

    @Autowired
    private TicketPriceRepo ticketPriceRepo;

    private double getDiscountRate(String priceName) {
        // Optional 안전하게 처리 - 값 없으면 기본 100% (1.0)로 처리
        return ticketPriceRepo.findByPriceName(priceName)
            .map(tp -> tp.getPriceDetail() / 100.0)
            .orElse(1.0);  // 값 없으면 할인 0% = 1.0 반환
    }

    public int calculateBasePrice(String classType, int adult, int child, int infant) {
        // 좌석 기본 가격 조회도 Optional 처리
        int basePrice = ticketPriceRepo.findByPriceName(classType)
            .map(TicketPrice::getPriceDetail)
            .orElse(0);  // 없으면 0원 처리

        double adultRate = getDiscountRate("adult");
        double childRate = getDiscountRate("child");
        double infantRate = getDiscountRate("infant");

        double total = adult * basePrice * adultRate
                     + child * basePrice * childRate
                     + infant * basePrice * infantRate;

        return (int) total;
    }
    
    public String getTimeCategory(LocalTime departureTime) {
        int hour = departureTime.getHour();

        if (hour >= 1 && hour <= 5) {
            return "dawn";
        } else if (hour >= 6 && hour <= 8) {
            return "morning";
        } else if (hour >= 13 && hour <= 16) {
            return "afternoon";
        } else {
            return "none";  // 할인 없음
        }
    }

    public int applyTimeDiscount(int basePrice, String timeCategory) {
        if ("none".equals(timeCategory)) {
            return basePrice;  // 할인 안 함
        }

        Optional<TicketPrice> discountOpt = ticketPriceRepo.findByPriceName(timeCategory);
        if (discountOpt.isEmpty()) {
            return basePrice; // 데이터 없으면 할인 없음 처리
        }

        int discountPercent = discountOpt.get().getPriceDetail();  // 예: 80, 100
        return basePrice * discountPercent / 100;
    }

    public int applyFareType(int price, String fareType) {
        int fareExtra = ticketPriceRepo.findByPriceName(fareType)
                          .map(TicketPrice::getPriceDetail)
                          .orElse(0); // 없으면 0원 추가

        return price + fareExtra;
    }

    public int calculateFinalPrice(String classType, int adult, int child, int infant, String timeCategory, String fareType) {
        int base = calculateBasePrice(classType, adult, child, infant);
        int afterTimeDiscount = applyTimeDiscount(base, timeCategory);
        return applyFareType(afterTimeDiscount, fareType);
    }
}

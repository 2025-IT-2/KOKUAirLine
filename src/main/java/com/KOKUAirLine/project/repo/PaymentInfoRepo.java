package com.KOKUAirLine.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.PaymentInfo;

@Repository
public interface PaymentInfoRepo extends JpaRepository<PaymentInfo, Long> {
    
    // 만약 특정 예약번호로 결제 정보를 찾고 싶다면 이렇게 추가할 수도 있어요
	PaymentInfo findByReservation_ResiNum(Long resiNum);

    // 결제 상태별로 조회하고 싶다면 (예: 미결제 목록)
    List<PaymentInfo> findByPaymentStat(Integer paymentStat);
}

package com.KOKUAirLine.project.service;

import java.util.Date;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.KOKUAirLine.project.model.NoticeDTO;
import com.KOKUAirLine.project.repo.NoticeRepository;

@Configuration
public class NoticetestService {
	
	@Bean
    public CommandLineRunner initData(NoticeRepository noticeRepository) {
        return args -> {


                NoticeDTO notice = new NoticeDTO();
                notice.setId(1L);
                notice.setTitle("ナリタ - マニラ線新規就航のお知らせ");
                notice.setContent("7월1일부 나리타-마닐라 노선을 매일 운행합니다!\n동남아 필리핀 최고의 휴양지 마닐라! 지금 바로 예약하세요!");
                notice.setRegDate(new Date());
                noticeRepository.save(notice);
                System.out.println("★ 테스트 공지사항 등록 완료");
            
        };
    }

}

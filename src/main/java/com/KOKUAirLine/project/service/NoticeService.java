package com.KOKUAirLine.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageRequest;

import com.KOKUAirLine.project.model.NoticeDTO;
import com.KOKUAirLine.project.repo.NoticeRepository;

@Service
public class NoticeService {
	
	@Autowired
    private NoticeRepository noticeRepository;

    // 공지 저장 (등록)
    public NoticeDTO saveNotice(NoticeDTO notice) {
        return noticeRepository.save(notice);
    }

    // ID로 공지 하나 조회
    public NoticeDTO getNoticeById(Long id) {
        return noticeRepository.findById(id).orElse(null);
    }

    // 모든 공지 리스트 조회
    public List<NoticeDTO> getAllNotices() {
        return noticeRepository.findAll();
    }
}

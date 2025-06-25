package com.KOKUAirLine.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KOKUAirLine.project.model.NoticeDTO;
import com.KOKUAirLine.project.repo.NoticeRepository;

@Service
public class NoticeService {
	
	@Autowired
    private NoticeRepository noticeRepository;

    public NoticeDTO getLatestNotice() {
        return noticeRepository.findLatest();
    }

}

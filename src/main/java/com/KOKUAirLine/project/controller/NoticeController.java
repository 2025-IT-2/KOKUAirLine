package com.KOKUAirLine.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KOKUAirLine.project.model.NoticeDTO;
import com.KOKUAirLine.project.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // /notice 로 접근하면 가장 최신 공지를 보여줌
    @GetMapping
    public String showNotice(Model model) {
        NoticeDTO notice = noticeService.getNoticeById(1L); // ID 1 고정
        model.addAttribute("notice", notice);
        return "notice"; // /WEB-INF/views/notice.jsp
    }
}
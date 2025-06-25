package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KOKUAirLine.project.model.NoticeDTO;
import com.KOKUAirLine.project.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
    private NoticeService noticeService;

    @GetMapping("/notice")
    public String showNotice(Model model) {
        NoticeDTO notice = noticeService.getLatestNotice();
        model.addAttribute("notice", notice);
        return "notice";  // notice.jsp
    }

}

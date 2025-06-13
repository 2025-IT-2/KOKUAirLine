package com.KOKUAirLine.project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BoardingPassInfo {

    @GetMapping("/boardingPassInfo")
    public String boardingPassInfo() {
        return "boardingPassInfo"; // -> /WEB-INF/views/boardingPassInfo.jsp 로 이동
    }
    
    
}

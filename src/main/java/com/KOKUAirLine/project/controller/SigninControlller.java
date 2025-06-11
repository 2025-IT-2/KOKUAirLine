package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SigninControlller {

    @GetMapping("/signin")
    public String signin() {
        return "signin"; // -> /WEB-INF/views/signin.jsp 로 이동
    }
}

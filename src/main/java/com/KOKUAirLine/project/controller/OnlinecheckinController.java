package com.KOKUAirLine.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller	
public class OnlinecheckinController {

    @GetMapping("/onlinecheckin")
    public String onlinecheckin() {
        return "onlinecheckin";

	}

}

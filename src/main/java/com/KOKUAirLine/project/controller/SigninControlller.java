package com.KOKUAirLine.project.controller;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

@Controller
public class SigninControlller {

    @GetMapping("/signin")
    public String signin() {
        return "signin"; // -> /WEB-INF/views/signin.jsp 로 이동
    }
    
    private final UserInfoRepo userInfoRepository;

    public SigninControlller(UserInfoRepo userInfoRepository) {
        this.userInfoRepository = userInfoRepository;
    }

    @PostMapping("/signin")
    public String register(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes) {
    	System.out.println("test1");


        UserInfo user = new UserInfo();
        user.setUserId(params.get("ID"));
        if (userInfoRepository.existsById(user.getUserId())) {
        	redirectAttributes.addFlashAttribute("error", "이미 사용 중인 ID입니다.");
        	return "redirect:/register";
        }
        user.setPassword(params.get("pw"));
        user.setEmail(params.get("EMAIL"));
        user.setUserFirstName(params.get("firstname"));
        user.setUserLastName(params.get("lastname"));
//        user.setGender(Integer.parseInt(params.get("gender")));
        String genderParam = params.get("gender");
        user.setGender("male".equalsIgnoreCase(genderParam)); // male → true, female → false
        user.setBirthDate(LocalDate.parse(params.get("birthdate"))); // yyyy-MM-dd
        user.setUserPhone(Integer.parseInt(params.get("phone")));
        user.setNational(params.get("nationality"));
        
        System.out.println("test");
        
        userInfoRepository.save(user); // Correct usage of the instance method

        return "redirect:/success";
    }
    
}

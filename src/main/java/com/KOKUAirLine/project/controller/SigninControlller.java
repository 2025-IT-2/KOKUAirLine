package com.KOKUAirLine.project.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    public String signin(@RequestParam Map<String, String> params, RedirectAttributes redirectAttributes) {
    	System.out.println("test1");

    	if (params.get("ID").length() < 4 || params.get("ID").length() > 20) {
    	    throw new IllegalArgumentException("아이디는 4~20자 사이여야 합니다.");
    	}
    	if (params.get("pw").length() < 8 || params.get("pw").length() > 20) {
    	    throw new IllegalArgumentException("비밀번호는 8~20자 사이여야 합니다.");
    	}

        UserInfo user = new UserInfo();
        user.setUserId(params.get("ID"));
//        //id가 없으면 에러처리
//        if (user == null || user.getUserId().isEmpty()) {
//            redirectAttributes.addFlashAttribute("error", "ID는 필수 입력 항목입니다.");
//            return "redirect:/signin";  // ID가 없으면 다시 signin 페이지로 리다이렉트
//        }
        //id 중복 확인
        System.out.println("id값 받음!");
        if (userInfoRepository.existsById(user.getUserId())) {
        	redirectAttributes.addFlashAttribute("error", "이미 사용 중인 ID입니다.");
        	return "redirect:/signin";
        }
        System.out.println("id값 중복처리 받음!");
        user.setPassword(params.get("pw"));
        System.out.println("pw값 받음!");
        user.setEmail(params.get("EMAIL"));
        System.out.println("EMAIL값 받음!");
        user.setUserFirstName(params.get("firstname"));
        System.out.println("firstname값 받음!");
        user.setUserLastName(params.get("lastname"));
        System.out.println("lastname값 받음!");
//        user.setGender(Integer.parseInt(params.get("gender")));
        String genderParam = params.get("gender");
        user.setGender("male".equalsIgnoreCase(genderParam)); // male → true, female → false
        System.out.println("gender값 받음!");
        user.setBirthDate(LocalDate.parse(params.get("birthdate"))); // yyyy-MM-dd
        System.out.println("birthdate값 받음!");
        user.setUserPhone(params.get("phone"));
        System.out.println("phone값 받음!");
        user.setNational(params.get("nationality"));
        System.out.println("nationality값 받음!");
        user.setCreateDate(LocalDateTime.now());        
        System.out.println("DB에 생성날짜 입력함!");
        System.out.println("test");
        userInfoRepository.save(user); // Correct usage of the instance method

        return "redirect:/home";
    }
    
//    @GetMapping("/home")
//    public String showHomePage() {
//        return "home";  // -> /WEB-INF/views/home.jsp 로 이동
//    }
    
}

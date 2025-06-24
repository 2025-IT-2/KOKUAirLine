package com.KOKUAirLine.project.controller;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

import jakarta.validation.Valid;

@Controller
public class SigninControlller {

	@GetMapping("/signin")
	public String showSigninForm(Model model) {
	    model.addAttribute("userInfo", new UserInfo());

	    String[] countryCodes = Locale.getISOCountries();
	    Map<String, String> countryMap = new LinkedHashMap<>();
	    for (String code : countryCodes) {
	        Locale locale = new Locale("", code);
	        countryMap.put(code, locale.getDisplayCountry(Locale.JAPAN)); // 일본어로 국가명
	    }
	    model.addAttribute("countryMap", countryMap);

	    return "signin";
	}
    
    private final UserInfoRepo userInfoRepository;

    public SigninControlller(UserInfoRepo userInfoRepository) {
        this.userInfoRepository = userInfoRepository;
    }

    @PostMapping("/signin")
    public String signin(
        @Valid @ModelAttribute("userInfo") UserInfo userInfo,
        BindingResult bindingResult,
        RedirectAttributes redirectAttributes
    ) {
        // 유효성 검사 실패 시 다시 폼으로
        if (bindingResult.hasErrors()) {
        	
            return "signin";
        }

        // ID 중복 확인
        if (userInfoRepository.existsById(userInfo.getUserId())) {
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 ID입니다.");
            return "redirect:/signin";
        }

        userInfo.setCreateDate(LocalDateTime.now());
        userInfoRepository.save(userInfo);
        return "redirect:/home";
    }

}

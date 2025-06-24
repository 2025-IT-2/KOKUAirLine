package com.KOKUAirLine.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.KOKUAirLine.project.model.UserInfo;
import com.KOKUAirLine.project.repo.UserInfoRepo;

@Controller
public class FindUserInfoController {

    @Autowired
    private UserInfoRepo userInfoRepo;

    @GetMapping("/findUserInfo")
    public String showFindUserForm() {
        return "findUserInfo"; // JSP 파일명 (findUserInfo.jsp)
    }

    @PostMapping("/findUserInfo")
    public String processFindUser(
            @RequestParam("lastname") String lastName,
            @RequestParam("firstname") String firstName,
            @RequestParam("phone") String phone,
            Model model) {

        UserInfo user = userInfoRepo.findByNameAndPhone(lastName, firstName, phone);

        if (user != null) {
            model.addAttribute("userId", user.getUserId());
            model.addAttribute("password", user.getPassword()); // 비밀번호 평문이라면 주의 필요
        } else {
            model.addAttribute("error", "入力した内容と一致するユーザーがいません");
        }

        return "findUserInfo"; // 다시 같은 JSP로 결과 전달
    }
}

package com.KOKUAirLine.project.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo {

    @Id
    @NotBlank(message = "아이디를 입력해주세요.")
    @Size(min = 8, max = 20, message = "아이디는 8자 이상 20자 이하로 입력해주세요.")
    @Pattern(regexp = "^[a-zA-Z0-9]{8,20}$", message = "아이디는 영문 대소문자, 숫자만 입력 가능합니다.")
    private String userId;

    @NotBlank(message = "비밀번호를 입력해주세요.")
    @Size(min = 8, max = 20, message = "비밀번호는 8자 이상 20자 이하로 입력해주세요.")
    @Pattern(
        regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,20}$",
        message = "비밀번호는 영문 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 1개 이상 포함해야 합니다."
    )
    private String password;

    @NotBlank(message = "이메일을 입력해주세요.")
    @Email(message = "올바른 이메일 형식이 아닙니다.")
    private String email;

    @NotBlank(message = "성을 입력해주세요.")
    @Size(max = 20, message = "성은 최대 20자까지 입력할 수 있습니다.")
    private String userLastName;

    @NotBlank(message = "이름을 입력해주세요.")
    @Size(max = 20, message = "이름은 최대 20자까지 입력할 수 있습니다.")
    private String userFirstName;

    @NotNull(message = "생년월일을 입력해주세요.")
    private LocalDate birthDate;

    @NotNull(message = "성별을 선택해주세요.") // true/false지만 NotNull로 체크 가능
    private Boolean gender;

    @NotBlank(message = "국적을 입력해주세요.")
    @Size(max = 30, message = "국적은 최대 30자까지 입력할 수 있습니다.")
    private String national;

    @NotBlank(message = "전화번호를 입력해주세요.")
    @Pattern(
        regexp = "^(\\+\\d{1,3}[- ]?)?\\d{7,15}$",
        message = "전화번호는 국제번호 형식(+82 10 12345678 포함) 또는 7~15자리 숫자여야 합니다."
    )
    private String userPhone;


    private LocalDateTime createDate;
}

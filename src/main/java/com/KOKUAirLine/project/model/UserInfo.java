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
    @NotBlank(message = "ID（アイディー）を入力してください。")
    @Size(min = 8, max = 20, message = "ID（アイディー）は8文字以上20文字以下で入力してください。")
    @Pattern(regexp = "^[a-zA-Z0-9]{8,20}$", message = "ID（アイディー）は英字（えいじ：大文字・小文字）と数字（すうじ）のみ使用できます。")
    private String userId;

    @NotBlank(message = "パスワード（英語：Password）を入力してください。")
    @Size(min = 8, max = 20, message = "パスワードは8文字以上20文字以下で入力してください。")
    @Pattern(
        regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,20}$",
        message = "パスワードは英大文字（えいだいもじ）、小文字（こもじ）、数字（すうじ）、記号（きごう：!@#$%^&*）をそれぞれ1文字以上含めてください。"
    )
    private String password;

    @NotBlank(message = "メールアドレス（めーるあどれす）を入力してください。")
    @Email(message = "有効（ゆうこう）なメールアドレスの形式（けいしき）で入力してください。")
    private String email;

    @NotBlank(message = "姓（せい）を入力してください。")
    @Size(max = 20, message = "姓（せい）は最大20文字まで入力可能（にゅうりょくかのう）です。")
    private String userLastName;

    @NotBlank(message = "名（な）を入力してください。")
    @Size(max = 20, message = "名（な）は最大20文字まで入力可能（にゅうりょくかのう）です。")
    private String userFirstName;

    @NotNull(message = "生年月日（せいねんがっぴ）を入力してください。")
    private LocalDate birthDate;

    @NotNull(message = "性別（せいべつ）を選択（せんたく）してください。")
    private Boolean gender;

    @NotBlank(message = "国籍（こくせき）を入力してください。")
    @Size(max = 30, message = "国籍（こくせき）は最大30文字まで入力可能（にゅうりょくかのう）です。")
    private String national;

    @NotBlank(message = "電話番号（でんわばんごう）を入力してください。")
    @Pattern(
        regexp = "^(\\+\\d{1,3}[- ]?)?[\\d-]{7,20}$",
        message = "電話番号（でんわばんごう）は国際形式（こくさいけいしき：+82 10 12345678など）または7〜15桁の数字（すうじ）で入力してください。"
    )
    private String userPhone;

    private LocalDateTime createDate;
}

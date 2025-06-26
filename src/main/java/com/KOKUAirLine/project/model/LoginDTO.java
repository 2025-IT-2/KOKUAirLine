package com.KOKUAirLine.project.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginDTO {

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
}


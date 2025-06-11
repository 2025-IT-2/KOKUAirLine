<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
	<title>会員登録</title>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />

</head>
<body>
  <div class="screen">
    <div class="view-wrapper">
      <div class="view">
        <div class="overlap">
          <div class="div"></div>
          <div class="overlap-wrapper">
            <div class="overlap-2">
              <div class="rectangle-2"></div>

              <!-- 회원가입 form 시작 -->
              <form action="home.jsp" method="get" id="signin">
                <div class="group-wrapper">
                  <div class="overlap-group-wrapper">
                    <div class="div-wrapper">
                      <div class="text-wrapper-4">PW</div>
                    </div>
                    <div class="input-type">
                      <div class="input-pw">
                        <input type="text" id="input-pw" name="pw" placeholder="最小８文字、最大１６文字">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="group-9">
                  <div class="group-10">
                    <div class="div-wrapper">
                      <div class="text-wrapper-9">ID</div>
                    </div>
                    <div class="input-type">
                      <div class="input-id">
                        <input type="text" id="input-id" name="ID" placeholder="중복확인을 진행합니다">
                      </div>
                    </div>
                  </div>

                  <div class="group-11">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-10">性別</div>
                      </div>
                    </div>
                  </div>

                  <div class="group-12">
                    <div class="div-wrapper">
                      <div class="text-wrapper-11">生年月日</div>
                    </div>
                  </div>

                  <div class="group-13">
                    <div class="div-wrapper">
                      <div class="text-wrapper-12">メール</div>
                    </div>
                    <div class="input-type">
                      <div class="input-mail">
                        <input type="text" id="input-mail" name="EMAIL" placeholder="중복확인을 진행합니다">
                      </div>
                    </div>
                  </div>

                  <div class="group-14">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-13">名前</div>
                      </div>
                      <div class="input-type">
                        <div class="input-fn">
                          <input type="text" id="firstname" name="firstname" placeholder="중복확인을 진행합니다">
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="group-15">
                    <div class="overlap-group-wrapper">
                      <div class="div-wrapper">
                        <div class="text-wrapper-14">苗字</div>
                      </div>
                      <div class="input-type">
                        <div class="input-ln">
                          <input type="text" id="lastname" name="lastname" placeholder="중복확인을 진행합니다">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="gender-type">
                  <div class="gender-type2">
                    <input class="male" type="radio" name="gender" value="male"> 男性
                    <input class="female" type="radio" name="gender" value="female"> 女性
                  </div>
                </div>

                <div class="group-4">
                  <div class="overlap-group-2">
                    <div class="text-wrapper-6">年 月 日</div>
                  </div>
                </div>

                <div class="calender-nen">
                  <div class="text-wrapper-7">ダ</div>
                </div>

                <!-- 버튼은 form 내부로 이동 -->
                <button type="submit" class="signin">会員登録</button>
              </form>
              <!-- 회원가입 form 끝 -->
            </div>
          </div>

          <div class="group-2">
            <div class="overlap-3">
              <div class="rectangle-3"></div>
              <div class="text-wrapper-5">会員登録</div>
            </div>
          </div>

          <div class="group-6">
            <div class="rectangle-4">
              <div></div>
            </div>
            <div class="overlap-5">
              <div class="rectangle-5"></div>
              <div class="rectangle-6"></div>
              <div class="rectangle-7"></div>
              <div class="rectangle-8"></div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</body>
</html>

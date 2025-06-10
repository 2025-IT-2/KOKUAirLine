<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
    <title>로그인</title>
  </head>
  <body>
    <div class="screen">
      <div class="view-wrapper">
        <div class="view">
          <div class="overlap">
            <div class="div"></div>

            <!-- 상단 메뉴 영역 -->
            <div class="group">
              <div class="overlap-group">
                <img class="img" src="${pageContext.request.contextPath}/resources/img/group-37.png" />
                <div class="text-wrapper">空港団</div>
                <div class="text-wrapper-2">予約</div>
                <div class="text-wrapper-3">オンライン·チェックイン</div>
                <div class="text-wrapper-4">予約確認</div>
                <img class="rectangle" src="${pageContext.request.contextPath}/resources/img/rectangle-58.svg" />
                <div class="text-wrapper-5">ログイン</div>
              </div>
            </div>

            <!-- 로그인 폼 -->
            <div class="overlap-wrapper">
              <div class="overlap-2">
                <img class="rectangle-2" src="${pageContext.request.contextPath}/resources/img/rectangle-36.svg" />
                <div class="overlap-group-wrapper">
                  <div class="overlap-3">
                    <img class="rectangle-3" src="${pageContext.request.contextPath}/resources/img/rectangle-66.svg" />

                    <!-- 로그인 form -->
                    <form action="login.do" method="post">
                      <div class="rectangle-4"></div>
                      <div class="rectangle-5"></div>
                      <div class="rectangle-6"></div>
                      <div class="rectangle-7"></div>
                      <div class="rectangle-8"></div>

                      <div class="div-wrapper">
                        <div class="overlap-group-2">
                          <label for="password" class="text-wrapper-6">PW</label>
                          <input type="password" name="password" id="password" required />
                        </div>
                      </div>

                      <div class="group-2">
                        <div class="overlap-group-2">
                          <label for="username" class="text-wrapper-7">ID</label>
                          <input type="text" name="username" id="username" required />
                        </div>
                      </div>

                      <button type="submit" class="text-wrapper-8">ログイン</button>
                      <label><input type="checkbox" name="autoLogin" /> 自動ログイン</label>
                    </form>

                    <div class="text-wrapper-11">まだ会員ではありませんか？</div>
                    <img class="line" src="${pageContext.request.contextPath}/resources/img/line-13.svg" />

                    <div class="group-3">
                      <div class="overlap-4">
                        <div class="rectangle-9"></div>
                        <form action="register.do" method="get">
                          <button type="submit" class="text-wrapper-12">会員登録</button>
                        </form>
                      </div>
                    </div>

                  </div> <!-- overlap-3 -->
                </div>
              </div>
            </div>

          </div> <!-- overlap -->
        </div>
      </div>
    </div>
  </body>
</html>

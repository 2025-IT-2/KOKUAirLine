<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>ログイン</title>

  <!-- CSS 경로 정리 -->
  <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/login.css' />" />
</head>
<body>
  <%@ include file="header.jsp" %>

	<c:if test="${not empty loginError}">
	    <input type="hidden" id="loginErrorMessage" value="${loginError}" />
	</c:if>
	

  <main class="login-screen">
    <section class="login-container">

      <h1 class="login-title">空港団 ログイン</h1>

      <form action="/login" method="post" class="login-form">
        <div class="form-group">
          <label for="username">ID</label>
          <input type="text" name="userId" id="username" minlength="4" maxlength="20" required />
        </div>

        <div class="form-group">
          <label for="password">PW</label>
          <input type="password" name="password" id="password" minlength="8" maxlength="20" required />
        </div>

        <div class="form-options">
          <label>
            <input id="autoLoginCheckBox" type="checkbox" name="autoLogin" />自動ログイン
          </label>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn login-btn">ログイン</button>
        </div>
      </form>

      <hr class="separator" />	  
	  <button class="btn idpw-btn" onclick="openWindow()">ID・PASSWORDを忘れた方はこちら</button>
	  
      <hr class="separator" />
      <p class="signup-question">まだ会員ではありませんか？</p>
      <form id="registerBtn" action="/signin" method="get">
        <button type="submit" class="btn signup-btn">会員登録</button>
      </form>

    </section>
  </main>
  <!-- JS 파일 링크 -->
  <script src="/js/login.js"></script>
</body>
</html>

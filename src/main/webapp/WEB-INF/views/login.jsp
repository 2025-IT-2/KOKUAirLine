<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>ログイン</title>

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

      <form:form modelAttribute="userInfo" action="/login" method="post" class="login-form">
        <div class="form-group">
          <label for="username">ID</label>
          <form:input path="userId" id="username" cssClass="form-control" minlength="4" maxlength="20" required="true" />
          <form:errors path="userId" cssClass="error-message" />
        </div>

        <div class="form-group">
          <label for="password">PW</label>
          <form:password path="password" id="password" cssClass="form-control" minlength="8" maxlength="20" required="true" />
          <form:errors path="password" cssClass="error-message" />
        </div>

        <div class="form-options">
          <label>
            <input id="autoLoginCheckBox" type="checkbox" name="autoLogin" />自動ログイン
            <checkbox id="autoLoginCheckBox" />
          </label>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn login-btn">ログイン</button>
        </div>
      </form:form>

      <hr class="separator" />
      <button class="btn idpw-btn" onclick="openWindow()">ID・PASSWORDを忘れた方はこちら</button>

      <hr class="separator" />
      <p class="signup-question">まだ会員ではありませんか？</p>
      <form id="registerBtn" action="/signin" method="get">
        <button type="submit" class="btn signup-btn">会員登録</button>
      </form>
    </section>
  </main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="/js/login.js"></script>
</body>
</html>

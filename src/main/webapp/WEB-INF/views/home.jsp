<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/main.css' />" />
  </head>
  <body>
    <div class="screen">
      <div class="view-wrapper">
        <div class="header-bar">
          <div class="logo">空港団</div>
          <div class="nav-links">
            <div>予約</div>
            <div>オンライン·チェックイン</div>
            <div>予約確認</div>
          </div>
          <button class="login-button">ログイン</button>
        </div>
        <div class="chatgpt-image-wrapper">
          <img src="<c:url value='/img/homepageImage.png' />" alt="Main Visual" />
        </div>
      </div>
    </div>
  </body>
</html>

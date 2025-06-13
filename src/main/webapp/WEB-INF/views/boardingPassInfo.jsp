<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<html>
<head>
  <meta charset="utf-8" />
  <title>搭乗券発行</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/boardingPassInfo.css'/>">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
  <%@ include file="header.jsp" %>
  <div class="container">
        <div class="header">
          <h1>搭乗券情報</h1>
        </div>

        <div class="section-title">搭乗券発行</div>

        <div class="card">
          <div class="card-box">
            <h2>搭乗券</h2>
            <div class="btn-group">
              <a href="#" class="btn">メールで受け取る</a>
              <a href="#" class="btn">メッセージで受け取る</a>
			  <a href="#" class="btn" onclick="window.print(); return false;">印刷する</a>
            </div>
          </div>

          <div class="card-box">
            <h2>チェックイン</h2>
            <p>仁川 ‐ 沖縄<br>チェックイン完了</p>
          </div>
        </div>
      </div>
</body>
</html>

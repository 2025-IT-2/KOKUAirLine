<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
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

        <div class="section-title">搭乗券<br><div class='space'></div>発行完了</div>

        <div class="card">
			<div class="card-box" >
				<div id="print-area">
			  <h2>搭乗券</h2>
			  <div class="boarding-pass-card">
			    <h3 class="boarding-title">BOARDING PASS</h3>
				
			    <div class="boarding-info">
			      <!-- 출발 -->
			      <div class="info-card">
			        <div class="label">出発地<br><span class="jp">しゅっぱつち</span></div>
			        <div class="location"><c:out value="${departure}" default="출발지 없음" /></div>
			        <div class="time"><fmt:formatDate value="${departureTime}" pattern="HH:mm" /></div>
			      </div>

			      <div class="separator">-</div>

			      <!-- 도착 -->
			      <div class="info-card">
			        <div class="label">目的地<br><span class="jp">もくてきち</span></div>
			        <div class="location"><c:out value="${arrival}" default="도착지 없음" /></div>
			        <div class="time"><fmt:formatDate value="${arrivalTime}" pattern="HH:mm" /></div>
			      </div>
			    </div>
			    </div>
				
			</div>
				<div class="card">
				        <div class="card-box">
				          <h2>搭乗券送信</h2>
				          <div class="btn-group">
							<!--<a href="mailto:someone@example.com?subject=搭乗券のお知らせ&body=搭乗券が発行されました。詳細は以下のURLをご確認ください。https://yourdomain.com/boardingpass" class="btn">
							  メールで送信
							</a>-->
							<a href="#" class="btn" onclick="openPopup()" title="クリックするとメール送信画面が開きます。（まだです。）">
							  メールで送信
							</a>
							<br>
							<a href="https://social-plugins.line.me/lineit/share?url=https://example.com" class="btn" target="_blank">LINEで送信</a>
							<br>
							<a href="#" class="btn" onclick="window.print(); return false;">印刷する</a>
				          </div>
				        </div>
			  </div>

      </div>

	</body>
	</html>

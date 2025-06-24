<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8" />
  <title>搭乗券発行</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/boardingPassInfo.css'/>">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  
</head>
<body>
  <div class="container" id="boardingFrame">
        <div class="header">
          <h1>
          <ruby class="taxfree-t"><rb>搭乗券情報</rb><rt>とうじょうけんじょうほう</rt></ruby>
          </h1>
        </div>

        <div class="section-title"><ruby class="taxfree-t"><rb>搭乗券</rb><rt>とうじょうけん</rt></ruby><br>
        <div class='space'></div><ruby class="taxfree-t"><rb>発行完了</rb><rt>はっこうかんりょう</rt></ruby></div>

        <div class="card">
			<div class="card-box" >
				<div id="print-area">
			  <h2>
			  <ruby class="taxfree-t"><rb>搭乗券</rb><rt>とうじょうけん</rt></ruby>
			  </h2>
			  <div class="boarding-pass-card">
			    <h3 class="boarding-title">BOARDING PASS</h3>
				
			    <div class="boarding-info">
			      <!-- 출발 -->
			      <div class="info-card">
			        <div class="label">
			        <ruby class="taxfree-t"><rb>出発地</rb><rt>しゅっぱつち</rt></ruby>
			        </div>
			        <!--<div class="location"><div class="airport">${reservation.flightInfo.departure}</div></div>-->
			        <div class="location">
			        <c:choose>
				      <c:when test="${empty reservation.flightInfo.departure}">
				        <ruby class="taxfree-t"><rb>出発地無し</rb><rt>しゅっぱつちなし</rt></ruby>
				      </c:when>
				      <c:otherwise>
				        <c:out value="${reservation.flightInfo.departure}" />
				      </c:otherwise>
				    </c:choose>
			        </div>
			        <div class="time">
			        <fmt:formatDate value="${reservation.flightInfo.departureTime}" pattern="HH:mm" />
			        </div>
			      </div>

			      <div class="separator">-</div>

			      <!-- 도착 -->
			      <div class="info-card">
			        <div class="label">
			        <ruby class="taxfree-t"><rb>目的地</rb><rt>もくてきち</rt></ruby>
			        </div>
			        <div class="location">
			        <c:choose>
				      <c:when test="${empty reservation.flightInfo.arrival}">
				        <ruby class="taxfree-t"><rb>目的地無し</rb><rt>もくてきちなし</rt></ruby>
				      </c:when>
				      <c:otherwise>
				        <c:out value="${reservation.flightInfo.arrival}" />
				      </c:otherwise>
				    </c:choose>
			        </div>
			        <div class="time">
			        <fmt:formatDate value="${reservation.flightInfo.arrivalTime}" pattern="HH:mm" />
			        </div>
			      </div>
			    </div>
			    </div>
				
			</div>
				<div class="card">
				        <div class="card-box">
				          <h2>
				          <ruby class="taxfree-t"><rb>搭乗券送信</rb><rt>とうじょうけんそうしん</rt></ruby>
				          </h2>
				          <div class="btn-group">
							<a href="https://${mailUrl}" class="btn" target="_blank">メールで<br>
							<ruby class="taxfree-t"><rb>送信</rb><rt>そうしん</rt></ruby>
							</a>
							<br>
							<a href="https://social-plugins.line.me/lineit/share?url=https://example.com" class="btn" target="_blank">LINEで<br>
							<ruby class="taxfree-t"><rb>送信</rb><rt>そうしん</rt></ruby>
							</a>
							<br>
							<a href="#" class="btn" onclick="window.print(); return false;">
							<ruby class="taxfree-t"><rb>印刷</rb><rt>いんさつ</rt></ruby><br>
							<ruby class="taxfree-t"><rb>する</rb><rt>する</rt></ruby>
							</a>
				          </div>
				        </div>
			  </div>

      </div>

	</body>
	</html>

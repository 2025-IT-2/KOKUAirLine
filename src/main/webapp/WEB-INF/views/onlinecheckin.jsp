<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/onlinecheckin.css'/>" />
    <title>オンライン・チェックイン</title>
  </head>
  <body>
    <%@ include file="header.jsp" %>
    <div class="checkin-container">
      <div class="checkin-header"><ruby><rb>予約確認</rb><rt>よやくかくにん</rt></ruby></div>
	  <div class="checkin-infno"></div>
      <table class="checkin-table" id="reservationTable">
        <thead>
          <tr class="reservationN">
            <th><ruby><rb>予約番号</rb><rt>よやくばんごう</rt></ruby></th>
            <th><ruby><rb>出発日</rb><rt>しゅっぱつび</rt></ruby></th>
            <th><ruby><rb>出発地</rb><rt>しゅっぱつち</rt></ruby></th>
            <th><ruby><rb>到着地</rb><rt>とうちゃくち</rt></ruby></th>
            <th><ruby><rb>出発時間</rb><rt>しゅっぱつじかん</rt></ruby></th>
            <th><ruby><rb>到着時間</rb><rt>とうちゃくじかん</rt></ruby></th>
            <th><ruby><rb>航空便</rb><rt>こうくうびん</rt></ruby></th>
          </tr>
        </thead>
        <tbody>
		  <c:forEach var="reservation" items="${resList}">
			<tr class="reservationS" onclick="console.log('클릭됨'); location.href='/reservationCheck?resiNum=${reservation.resiNum}'">
		      <td id="resiNum">${reservation.resiNum}</td>
		      <!-- <td>${reservation.flightInfo.departureDate}</td>
			  날짜: YYYY-MM-DD -->
			  <td id="date"><fmt:formatDate value="${reservation.flightInfo.departureDate}" pattern="yyyy-MM-dd"/></td>

		      <td class="airport">${reservation.flightInfo.departure}</td>
		      <td class="airport">${reservation.flightInfo.arrival}</td>
		      <!-- <td>${reservation.flightInfo.departureTime}</td>
			  출발 시간: HH:mm:ss -->
			  <td class="time"><fmt:formatDate value="${reservation.flightInfo.departureTime}" pattern="HH:mm"/></td>

		      <!-- <td>${reservation.flightInfo.arrivalTime}</td>
			  도착 시간: HH:mm:ss -->
			  <td class="time"><fmt:formatDate value="${reservation.flightInfo.arrivalTime}" pattern="HH:mm"/></td>
		      <td id="flightNo">${reservation.flightInfo.flightNo}</td>
		    </tr>
		  </c:forEach>
		</tbody>
      </table>
      <div class="checkin-button">
        <a href="https://www.airport.kr/ap_ko/892/subview.do" target="_blank">チェックイン</a>
      </div>
    </div>
	<%@ include file="footer.jsp" %>
	<script>
	  document.addEventListener("DOMContentLoaded", () => {
	    const tbody = document.querySelector("tbody");
	    const rows = Array.from(tbody.querySelectorAll("tr"));

	    rows.sort((a, b) => {
	      const aVal = parseInt(a.children[0].textContent.trim());
	      const bVal = parseInt(b.children[0].textContent.trim());
	      return aVal - bVal; // 오름차순 정렬
	    });

	    // 기존 내용 제거 후 정렬된 순서대로 다시 추가
	    tbody.innerHTML = "";
	    rows.forEach(row => tbody.appendChild(row));
	  });
	</script>
  </body>
</html>

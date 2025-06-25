<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <div class="checkin-header">オンライン・チェックイン</div>
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
            <th><ruby><rb>航空会社</rb><rt>こうくうがいしゃ</rt></ruby></th>
          </tr>
        </thead>
        <tbody>
		  <c:forEach var="reservation" items="${resList}">
			<tr class="reservationS" onclick="console.log('클릭됨'); location.href='/reservationCheck?resiNum=${reservation.resiNum}'">
		      <td>${reservation.resiNum}</td>
		      <td>${reservation.flightInfo.departureDate}</td>
		      <td>${reservation.flightInfo.departure}</td>
		      <td>${reservation.flightInfo.arrival}</td>
		      <td>${reservation.flightInfo.departureTime}</td>
		      <td>${reservation.flightInfo.arrivalTime}</td>
		      <td>${reservation.flightInfo.flightNo}</td>
		    </tr>
		  </c:forEach>
		</tbody>
      </table>
      <div class="checkin-button">
        <a href="https://www.airport.kr/ap_ko/892/subview.do" target="_blank">チェックイン</a>
      </div>
    </div>
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

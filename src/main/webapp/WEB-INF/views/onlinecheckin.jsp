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
      <table class="checkin-table">
        <thead>
          <tr>
            <th>予約番号</th>
            <th>出発日</th>
            <th>出発地</th>
            <th>到着地</th>
            <th>出発時間</th>
            <th>到着時間</th>
            <th>航空会社</th>
          </tr>
        </thead>
        <tbody>
		  <c:forEach var="reservation" items="${resList}">
		    <tr>
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
  </body>
</html>

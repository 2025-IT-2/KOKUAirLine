<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>예약 확인</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />"/>
  <link rel="stylesheet" href="<c:url value='/css/reservationCheck.css'/>" />
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="screen">
	<div class="dual-panel">
	<!--왼쪽에는 예약 목록(기존 파일의 내용)
		오른쪽에는 선택한 예약의 탑승권이 나오고 탑승권 인쇄가 가능하도록
		 ㄴ (boardingPassInfo가 나올 수 있도록)-->
	<!--왼쪽 패널에 예약 목록이 나오도록-->
		<div class="left-panel">
			<h2 class="title">예약확인</h2>
				<div class="notice">
			       <h4>주의사항 :</h4>
			       <p>※ 항공권은 환불 불가일 수 있으며, 탑승 시간 2시간 전까지 체크인 바랍니다.</p>
			    </div>
			    <div class="view-wrapper">

			      <div class="view">

				    <c:forEach var="reservation" items="${resList}">
					    <div class="reservation-info">
					      <p><strong>${reservation.reservationHolder.userFirstName}</strong> 님의 예약번호는 <strong>${reservation.resiNum}</strong> 입니다.</p>
					      <div class="flight-info">
					        <div class="location">
					          <div class="airport">${reservation.flightInfo.departure}</div>
					          <div class="arrow">→</div>
					          <div class="airport">${reservation.flightInfo.arrival}</div>
					        </div>
					        <div class="details">
					          <div>항공사: 空港団</div>
					          <div>기내식: ${reservation.flightMealYN}</div>
					          <div>좌석등급: ${reservation.classType}</div>
					          <div>출발일: ${reservation.flightInfo.departureDate} / 도착일: ${reservation.flightInfo.arrivalDate}</div>
					        </div>
					      </div>
					    </div>
					    <div class="summary">
					      <div>총 인원: ${reservation.resNumL} + ${reservation.resNumM} + ${reservation.resNumS}명</div>
					      <div>총 결제금액: <%= r.totalPrice %>원</div>
					      <div>예약상태: ${reservation.cancelStep}</div>
					    </div>
					    <hr style="margin: 30px 0;" />
					<%
					    }
					%>
			        </c:forEach>
			      </div>
			    </div>
				<form action="reservationCheck.jsp" method="get">
				    <input type="hidden" name="selectedReservation" value="<%= r.reservationNumber %>" />
				    <button type="submit">탑승권 보기</button>
				</form>
		</div>
		<!-- 오른쪽 패널에 JSP를 iframe으로 포함 -->
		<div class="right-panel">
		  <iframe id="boardingFrame" src="boardingPassInfo.jsp?reservationNumber=ABC123" 
		          width="100%" height="400" style="border:none;"></iframe>
		</div>
	</div>
		<!--	<%@ include file="boardingPassInfo.jsp" %> -->
  </div>
</body>

<script>
  function showBoardingPass(index) {
    const data = <%= new com.google.gson.Gson().toJson(reservations) %>;
    const res = data[index];
    const frame = document.getElementById("boardingFrame");

    // 예약 번호를 URL 파라미터로 넘김
    frame.src = "boardingPass.jsp?reservationNumber=" + res.reservationNumber;
  }
</script>

</html>

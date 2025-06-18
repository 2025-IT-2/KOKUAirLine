<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

    <!-- 왼쪽: 예약 목록 -->
    <div class="left-panel">
      <h2 class="title">예약확인</h2>
      <div class="notice">
        <h4>주의사항 :</h4>
        <p>※ 항공권은 환불 불가일 수 있으며, 탑승 시간 2시간 전까지 체크인 바랍니다.</p>
      </div>
      <div class="view-wrapper">
      	<div class="view">
		  <c:choose>
		    <c:when test="${empty resList}">
		      <p style="text-align: center; font-size: 1.2em; color: gray; margin-top: 50px;">
		        예약 내역이 없습니다.
		      </p>
		    </c:when>
		    <c:otherwise>
		      <c:forEach var="reservation" items="${resList}" varStatus="status">
	            <div class="reservation-info">
	              <p><strong>${reservation.reservationHolder.userFirstName}</strong> 님의 예약번호는 
	                <strong>${reservation.reservationNumber}</strong> 입니다.</p>
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
	              <div>총 인원: ${reservation.resNumL + reservation.resNumM + reservation.resNumS}명</div>
	              <div>총 결제금액: ${reservation.totalPrice}원</div>
	              <div>예약상태: ${reservation.cancelStep}</div>
	            </div>
	            <form onsubmit="return showBoardingPass('${reservation.reservationNumber}')">
	              <button type="submit">탑승권 보기</button>
	            </form>
            	<hr style="margin: 30px 0;" />
          	</c:forEach>
          	</c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>

    <!-- 오른쪽: 탑승권 표시 iframe -->
    <div class="right-panel">
      <iframe id="boardingFrame" src="" width="100%" height="400" style="border:none;"></iframe>
    </div>
  </div>
</div>

<script>
  function showBoardingPass(reservationNumber) {
    const frame = document.getElementById("boardingFrame");
    frame.src = "boardingPassInfo.jsp?reservationNumber=" + encodeURIComponent(reservationNumber);
    return false; // 폼 전송 방지
  }
</script>

</body>
</html>

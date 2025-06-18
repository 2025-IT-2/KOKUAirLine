<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*" %>
<!--<%
    class Reservation {
        String reservationNumber, departure, arrival, airline, tripType, seatClass, departureDate, arrivalDate, status;
        int totalPeople, totalPrice;

        public Reservation(String rNum, String dep, String arr, String air, String tType, String sClass,
                           String dDate, String aDate, int people, int price, String stat) {
            reservationNumber = rNum;
            departure = dep;
            arrival = arr;
            airline = air;
            tripType = tType;
            seatClass = sClass;
            departureDate = dDate;
            arrivalDate = aDate;
            totalPeople = people;
            totalPrice = price;
            status = stat;
        }
    }

    // 예시로 하드코딩한 예약 목록. 실제로는 DB에서 가져옴.
    List<Reservation> reservations = new ArrayList<>();
    reservations.add(new Reservation("ABC123", "仁川<br>ICN", "大阪<br>KIX", "아시아나 항공", "왕복", "일반석", "06.16(월)", "06.23(월)", 2, 500000, "결제완료"));
    reservations.add(new Reservation("DEF456", "김포<br>GMP", "제주<br>CJU", "대한항공", "편도", "비즈니스", "07.01(화)", "07.01(화)", 1, 150000, "결제완료"));

    String customerName = "홍길동";
%>
<%
    String selectedReservation = request.getParameter("selectedReservation");

    Reservation selectedRes = null;
    for (Reservation r : reservations) {
        if (r.reservationNumber.equals(selectedReservation)) {
            selectedRes = r;
            break;
        }
    }

    // 선택된 예약이 있을 경우 request scope에 저장
    if (selectedRes != null) {
        request.setAttribute("departure", selectedRes.departure.replaceAll("<br>", " "));
        request.setAttribute("arrival", selectedRes.arrival.replaceAll("<br>", " "));
        request.setAttribute("departureTime", new java.util.Date()); // 임시
        request.setAttribute("arrivalTime", new java.util.Date());   // 임시
    }
%>
-->

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

					<%
					    for (Reservation r : reservations) {
					%>
					    <div class="reservation-info">
					      <p><strong><%= customerName %></strong> 님의 예약번호는 <strong><%= r.reservationNumber %></strong> 입니다.</p>
					      <div class="flight-info">
					        <div class="location">
					          <div class="airport"><%= r.departure %></div>
					          <div class="arrow">→</div>
					          <div class="airport"><%= r.arrival %></div>
					        </div>
					        <div class="details">
					          <div>항공사: <%= r.airline %></div>
					          <div>운항종류: <%= r.tripType %></div>
					          <div>좌석등급: <%= r.seatClass %></div>
					          <div>출발일: <%= r.departureDate %> / 도착일: <%= r.arrivalDate %></div>
					        </div>
					      </div>
					    </div>
					    <div class="summary">
					      <div>총 인원: <%= r.totalPeople %>명</div>
					      <div>총 결제금액: <%= r.totalPrice %>원</div>
					      <div>예약상태: <%= r.status %></div>
					    </div>
					    <hr style="margin: 30px 0;" />
					<%
					    }
					%>
			        
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

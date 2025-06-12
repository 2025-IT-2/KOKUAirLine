<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
	
	<script> // 항공편 종류 버튼 selected
		document.addEventListener("DOMContentLoaded", function () {
		    const tripButtons = document.querySelectorAll(".trip-option");
		
		    tripButtons.forEach(button => {
		        button.addEventListener("click", () => {
		            tripButtons.forEach(btn => btn.classList.remove("selected"));
		            button.classList.add("selected");
		        });
		    });
		});
// 버튼 스타일 업데이트
		function selectTripType(type) {
			currentTripType = type;
			document.getElementById("tripTypeInput").value = type;
			toggleReturnDate(type);
			initFlatpickr(type);
		}
</script>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1" />
	    <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
		<link rel="stylesheet" href="<c:url value='/css/reservationCheckPrice.css'/>" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	    <title>航空券価格を確認</title>
	</head>
	<body>
	<%@ include file="header.jsp" %>
	<div class = "container">
	
	<!-- 예약 폼 -->
	<form action="/confirmReservation" method="post" class="reservation-form">
	
	<div class="info-bar">
	    <div class="info-box departure">
	        <span class="info-text">${departure}</span>
	</div>
	<div class="info-box arrival">
	    <span class="info-text">${arrival}</span>
	</div>
	<div class="info-box date-range">
	    <span class="info-text">${travelDate}</span>
	</div>
	<div class="info-box passenger-count">
	    <span class="info-text">성인 ${passengerCount}</span>
	    </div>
	    <div class="info-box seat-type">
	        <span class="info-text">エコノミー特価</span>
	    </div>
	</div>
	
	
	
	<!-- 출발 항공편 시간 -->
	<div class="form-section">
	    <label for="flightTime">출발 항공편 시간 선택:</label>
	    <select name="flightTime" id="flightTime">
	        <c:forEach var="f" items="${flightList}">
	<option value="${f.flightTime}">${f.flightTime}</option>
	</c:forEach>
	        <option value="time1">09:00 ~ 11:00</option>
	        <option value="time2">10:00 ~ 12:00</option>
	        <option value="time3">11:00 ~ 13:00</option>
	        <option value="time4">12:00 ~ 14:00</option>
	        <option value="time5">13:00 ~ 15:00</option>
	        <option value="time6">14:00 ~ 16:00</option>
	    </select>
	</div>
	
	<!-- 도착 항공편 시간 -->
	<div class="form-section">
	    <label for="flightTime2">도착 항공편 시간 선택:</label>
	    <select name="flightTime2" id="flightTime2">
	        <c:forEach var="f" items="${flightList}">
	<option value="${f.flightTime}">${f.flightTime}</option>
	</c:forEach>
	        <option value="time1">09:00 ~ 11:00</option>
	        <option value="time2">10:00 ~ 12:00</option>
	        <option value="time3">11:00 ~ 13:00</option>
	        <option value="time4">12:00 ~ 14:00</option>
	        <option value="time5">13:00 ~ 15:00</option>
	        <option value="time6">14:00 ~ 16:00</option>
	    </select>
	</div>
	
	<!-- 좌석 타입 -->
	   <div class = "container">
	<h2>エコノミー</h2>
	<div class = "trip-type" id = tripType>
	    <button type="button" class = "trip-option selected" data-type = "round" onclick = "selectTripType('round')">セイバー</button>
	<button type="button" class = "trip-option" data-type = "oneway" onclick = "selectTripType('oneway')">スタンダード</button>
	<button type="button" class = "trip-option" data-type = "multiway" onclick = "selectTripType('multiway')">フラックス</button>
	</div>
	
	<!-- 좌석 타입 -->
	   <div class = "container">
	<h2>エコノミー</h2>
	<div class = "trip-type2" id = tripType2>
	    <button type="button" class = "trip-option selected" data-type = "round" onclick = "selectTripType('round')">セイバー</button>
	<button type="button" class = "trip-option" data-type = "oneway" onclick = "selectTripType('oneway')">スタンダード</button>
	<button type="button" class = "trip-option" data-type = "multiway" onclick = "selectTripType('multiway')">フラックス</button>
	</div>
	
	<!-- 제출 버튼 -->
	            <div class="form-section">
	                <button type="submit">예약 확인</button>
	            </div>
	
	        </form>
	    </div>
	</div>
	
	</body>
</html>

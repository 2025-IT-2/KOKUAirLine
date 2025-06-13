<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
   
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1" />
       <link rel="stylesheet" href="<c:url value='/css/global.css'/>" />
      <link rel="stylesheet" href="<c:url value='/css/reservationCheckPrice.css'/>" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
       <title>航空券価格を確認</title>
       
       <link rel="stylesheet" type="text/css" href="style.css">
    <title>항공편 선택</title>
       
   </head>
   <body>
   <%@ include file="header.jsp" %>
   <div class = "container">
   
<<<<<<< Updated upstream
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
=======
<%--    <!-- 예약 폼 -->
   <form action="/reservationCheckPrice" method="post">

  출발지: <input type="text" name="departireAirport" value="${departireAirport}"/> <br/>
  도착지: <input type="text" name="arrivalAirport" value="${arrivalAirport}"/> <br/>
  
  출발일: <input type="date" name="departureDate" value="${departureDate}"/> <br/>
  돌아오는 날 (왕복일 경우): <input type="date" name="returnDate" value="${returnDate}"/> <br/>
  
  성인: <input type="number" name="adultCount" value="${adultCount}" min="0"/> <br/>
  어린이: <input type="number" name="childCount" value="${childCount}" min="0"/> <br/>
  유아: <input type="number" name="infantCount" value="${infantCount}" min="0"/> <br/>
  
  여행 유형: 
  <select name="tripType">
    <option value="oneway" ${tripType == 'oneway' ? 'selected' : ''}>편도</option>
    <option value="round" ${tripType == 'round' ? 'selected' : ''}>왕복</option>
  </select> <br/>
  
  클래스: 
  <select name="classType">
    <option value="eco-spec" ${classType == 'eco-spec' ? 'selected' : ''}>이코노미</option>
    <option value="business" ${classType == 'business' ? 'selected' : ''}>비즈니스</option>
  </select> <br/>
  
  <button type="submit">조회</button> --%>
  
<%-- </form>
<!-- 출발 항공편 시간 -->
>>>>>>> Stashed changes
   <div class="form-section">
       <label for="departureTime">출발 항공편 시간 선택:</label>
       <select name="departureTime" id="departureTime">
           <c:forEach var="f" items="${flightList}">
   <option value="${f.departureTime}">${f.departureTime}</option>
   </c:forEach>
           <option value="time1">09:00 ~ 11:00</option>
           <option value="time2">10:00 ~ 12:00</option>
           <option value="time3">11:00 ~ 13:00</option>
           <option value="time4">12:00 ~ 14:00</option>
           <option value="time5">13:00 ~ 15:00</option>
           <option value="time6">14:00 ~ 16:00</option>
       </select>
   </div>
   
   <!-- 첫 번째 좌석 타입 -->
   <div class="class-box">
      <h2>出発便：エコノミー</h2>
      <div class="trip-type" id="tripType">
         <button type="button" class="trip-option selected" data-type="round" onclick="selectTripType('round')">セイバー</button>
         <button type="button" class="trip-option" data-type="oneway" onclick="selectTripType('oneway')">スタンダード</button>
         <button type="button" class="trip-option" data-type="multiway" onclick="selectTripType('multiway')">フラックス</button>
      </div>
   </div>
   
   <!-- 도착 항공편 시간 -->
   <div class="form-section">
       <label for="arrivalTime">도착 항공편 시간 선택:</label>
       <select name="arrivalTime" id="arrivalTime">
           <c:forEach var="f" items="${flightList}">
   <option value="${f.arrivalTime}">${f.arrivalTime}</option>
   </c:forEach>
           <option value="time1">09:00 ~ 11:00</option>
           <option value="time2">10:00 ~ 12:00</option>
           <option value="time3">11:00 ~ 13:00</option>
           <option value="time4">12:00 ~ 14:00</option>
           <option value="time5">13:00 ~ 15:00</option>
           <option value="time6">14:00 ~ 16:00</option>
       </select>
   </div>
   
   <div class="container">

   <!-- 두 번째 좌석 타입 -->
   <div class="class-box">
      <h2>到着便：エコノミー</h2>
      <div class="trip-type2" id="tripType2">
         <button type="button" class="trip-option selected" data-type="round" onclick="selectTripType('round')">セイバー</button>
         <button type="button" class="trip-option" data-type="oneway" onclick="selectTripType('oneway')">スタンダード</button>
         <button type="button" class="trip-option" data-type="multiway" onclick="selectTripType('multiway')">フラックス</button>
      </div>
   </div>

<!-- </div>
   
   제출 버튼
               <div class="form-section">
                   <button type="submit">예약 확인</button>
               </div> -->
   
           </form>
       </div>
   </div> --%>
   
   <div class="flight-options">
    <div class="flight">
        <div class="time-info">
            <div class="time">8:50<br><span>터미널1</span></div>
            <div class="arrow">→</div>
            <div class="time">11:15<br><span>터미널1</span></div>
        </div>
        <div class="flight-details">
            <div class="flight-info">OZ172<br>A320</div>
            <div class="economy">
                <div class="fare">
                    <div class="type">セイバー</div>
                    <div class="price">16200円</div>
                    <div class="seats">9席</div>
                </div>
                <div class="fare">
                    <div class="type">スタンダード</div>
                    <div class="price">20600円</div>
                    <div class="seats">9席</div>
                </div>
                <div class="fare">
                    <div class="type">フラックス</div>
                    <div class="price">37000円</div>
                    <div class="seats">9席</div>
                </div>
            </div>
        </div>
    </div>

    <div class="flight">
        <div class="time-info">
            <div class="time">10:00<br><span>터미널1</span></div>
            <div class="arrow">→</div>
            <div class="time">01:05<br><span>터미널1</span></div>
        </div>
        <div class="flight-details">
            <div class="flight-info">OZ172<br>A320</div>
            <div class="economy">
                <div class="fare">
                    <div class="type">セイバー</div>
                    <div class="price">1300円</div>
                    <div class="seats">15席</div>
                </div>
                <div class="fare">
                    <div class="type">スタンダード</div>
                    <div class="price">15000円</div>
                    <div class="seats">5席</div>
                </div>
                <div class="fare">
                    <div class="type">フラックス</div>
                    <div class="price">32000円</div>
                    <div class="seats">4席</div>
                </div>
            </div>
        </div>
    </div>
</div>
   
   
   </body>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
	
	<script> // 항공편 종류 버튼 selected
	document.addEventListener("DOMContentLoaded", function () {
		// trip-type과 trip-type2 각각 처리
		document.querySelectorAll(".seat-type, .seat-type2").forEach(group => {
			const buttons = group.querySelectorAll(".seat-option");

			buttons.forEach(button => {
				button.addEventListener("click", () => {
					buttons.forEach(btn => btn.classList.remove("selected"));
					button.classList.add("selected");
				});
			});
		});
	});
// 버튼 스타일 업데이트
		function selectSeatType(type) {
			currentSeatType = type;
			document.getElementById("seatTypeInput").value = type;
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
<<<<<<< Updated upstream
	<%@ include file="header.jsp" %>
	<div class = "container">
	
	<!-- 예약 폼 -->
	<form action="/reservation" method="post">
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
	
=======
	<div class = "container">
>>>>>>> Stashed changes
	<div class="flight-list">
  <c:forEach var="flight" items="${flightList}">
    <div class="flight-card">
      <!-- 출발/도착 정보 -->
      <div class="flight-info">
        <div class="time">
          <span>${flight.departureTime}</span> → <span>${flight.arrivalTime}</span>
        </div>
        <div class="detail">
          <span>${flight.flightNumber}</span> / <span>${flight.aircraftType}</span>
        </div>
      </div>

      <!-- 좌석 타입 선택 -->
      <div class="seat-options">
        <label class="seat-option">
          <input type="radio" name="selectedFlight" value="${flight.id}_saver" required />
          <div class="seat-box saver">
            <div>セイバー</div>
            <div>${flight.saverPrice}円</div>
            <div>${flight.saverSeats}席</div>
          </div>
        </label>

        <label class="seat-option">
          <input type="radio" name="selectedFlight" value="${flight.id}_standard" />
          <div class="seat-box standard">
            <div>スタンダード</div>
            <div>${flight.standardPrice}円</div>
            <div>${flight.standardSeats}席</div>
          </div>
        </label>

        <label class="seat-option">
          <input type="radio" name="selectedFlight" value="${flight.id}_flex" />
          <div class="seat-box flex">
            <div>フラックス</div>
            <div>${flight.flexPrice}円</div>
            <div>${flight.flexSeats}席</div>
          </div>
        </label>
      </div>
    </div>
  </c:forEach>
</div>
<<<<<<< Updated upstream
	
	
	<!-- 출발 항공편 선택 (시간 + 클래스) 
	<div class="FlightTime-selection">
	    <label for="goFlightTime">출발 항공편 시간 선택:</label>
	    <select name="goFlightTime" id="goFlightTime">
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
	</div>-->
	
	<!-- 좌석 타입 
	   <!--<div class = "container">
	<h2>エコノミー</h2>
	<div class = "seat-type" id = seatType>
	<button type="button" class = "trip-option selected" data-type = "round" onclick = "selectSeatType('round')">セイバー</button>
	<button type="button" class = "seat-option" data-type = "oneway" onclick = "selectSeatType('oneway')">スタンダード</button>
	<button type="button" class = "seat-option" data-type = "multiway" onclick = "selectSeatType('multiway')">フラックス</button>
	</div>-->

	<!-- 도착 항공편 시간 
	<div class="FlightTime-selection">
	    <label for="backFlightTime">도착 항공편 시간 선택:</label>
	    <select name="backFlightTime" id="backFlightTime">
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
	</div>-->
	
	<!-- 좌석 타입 -->
	   <!--<div class = "container">
	<h2>エコノミー</h2>
	<div class = "seat-type2" id = seatType2>
	    <button type="button" class = "seat-option selected" data-type = "round" onclick = "selectSeatType('round')">セイバー</button>
	<button type="button" class = "seat-option" data-type = "oneway" onclick = "selectSeatType('oneway')">スタンダード</button>
	<button type="button" class = "seat-option" data-type = "multiway" onclick = "selectSeatType('multiway')">フラックス</button>
	</div>-->
	
	<!-- 제출 버튼 -->
	            <div class="confirm-button">
=======
<div class="confirm-button">
>>>>>>> Stashed changes
	                <button type="submit">예약 확인</button>
	            </div>
	
	        </form>
	    </div>
	</div>
	
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
	
	</body>
</html>
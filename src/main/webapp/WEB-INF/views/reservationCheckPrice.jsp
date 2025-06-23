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
</head>
<body>
   <%@ include file="header.jsp" %>
   <div class="container">
      <!-- 예약 폼 -->
      <form action="/passengerInfo" method="get"> 
   
      <div class="info-bar">
         <div class="info-box triptype">
            <span class="info-text">
              <c:choose>
                <c:when test="${param.tripType eq 'round'}">往復</c:when>
                <c:when test="${param.tripType eq 'oneway'}">片道</c:when>
                <c:when test="${param.tripType eq 'multiway'}">多区間</c:when>
                <c:otherwise>未選択</c:otherwise>
              </c:choose>
            </span>
             </div>
         <div class="info-box departure">
            <span class="info-text">${param.departureAirport}</span>
         </div>
         <div class="info-box arrival">
            <span class="info-text">${param.arrivalAirport}</span>
         </div>
         <div class="info-box date-range">
            <c:choose>
            <c:when test="${param.tripType eq 'round'}">
            <span class="info-text">${param.departureDate} ~ ${param.arrivalDate}</span>
            </c:when>
            <c:otherwise>
            <span class="info-text">${param.departureDate}</span>
            </c:otherwise>
            </c:choose>
         </div>
         <div class="info-box passenger-count">
            <span class="info-text">
               大人 ${param.adultCount}・小児 ${param.childCount}・幼児 ${param.infantCount}
            </span>
         </div>
         
         <input type="hidden" name="timeCategory" value="morning" />
         
         <div class="info-box seat-type">
            <c:choose>
            <c:when test="${param.classType eq 'eco-spec'}">エコノミー特価</c:when>
            <c:when test="${param.classType eq 'eco-norm'}">エコノミー一般</c:when>
            <c:when test="${param.classType eq 'buis'}">ビジネス</c:when>
            <c:when test="${param.classType eq 'first'}">ファースト</c:when>
            <c:otherwise>未選択</c:otherwise>
            </c:choose>
         </div>
      </div>

           
            <div class="flights-container">
            <!-- 출국편 -->
         <div class="flight-section">
           <div class="section-title">出国便</div>
           <div class="flight-options">
             <c:forEach var="flight" items="${flights}" varStatus="status">
               <div class="flight">
                 <div class="time-info">
                   <div class="time">
                     ${flight.departureTime}<br>
                     <span>터미널${flight.departureTerminal}</span>
                   </div>
                   <div class="arrow">↓</div>
                   <div class="time">
                     ${flight.arrivalTime}<br>
                     <span>터미널${flight.arrivalTerminal}</span>
                   </div>
                 </div>
                 <div class="flight-details">
                   <div class="flight-info">${flight.flightNo}<br>
                     <span>K${flight.airplaneNo}</span>
                   </div>
                   
                   <c:choose>
					<c:when test="${param.classType == 'eco-spec' || param.classType == 'eco-norm' || param.classType == 'buis' || param.classType == 'first'}">
						<div class="fare-options">
						<label class="fare" for="depFareType${status.index + 1}-saver" data-seat-available="${flight.seatRemain}">
						<input id="depFareType${status.index + 1}-saver" type="radio" name="depFareType" value="saver" style="display:none;" />
						<div class="content">
							<div class="type">セイバー</div>
							<div class="price">${saverPrice}円</div>
							<div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
						</div>
						</label>
					      
						<label class="fare" for="depFareType${status.index + 1}-standard" data-seat-available="${flight.seatRemain}">
						<input id="depFareType${status.index + 1}-standard" type="radio" name="depFareType" value="standard" style="display:none;" />
						<div class="content">
							<div class="type">スタンダード</div>
							<div class="price">${standardPrice}円</div>
							<div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
						</div>
						</label>
					
						<label class="fare" for="depFareType${status.index + 1}-flex" data-seat-available="${flight.seatRemain}">
						<input id="depFareType${status.index + 1}-flex" type="radio" name="depFareType" value="flex" style="display:none;" />
						<div class="content">
							<div class="type">フレックス</div>
							<div class="price">${flexPrice}円</div>
							<div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
						</div>
						</label>
					</div>
					</c:when>
              
              <c:otherwise>
                <p>座席クラスが選択されていません。</p>
              </c:otherwise>
            </c:choose>

                   </div>
                 </div>
               </div>
             </c:forEach>
           </div>
         </div>
          
            <!-- 귀국편 -->
         <c:if test="${param.tripType eq 'round'}">
         <div class="flight-section">
           <div class="section-title">帰国便</div>
           <div class="flight-options">
             <c:forEach var="flight" items="${arrFlights}" varStatus="status">
               <div class="flight">
                 <div class="time-info">
                   <div class="time">
                     ${flight.departureTime}<br>
                     <span>터미널${flight.departureTerminal}</span>
                   </div>
                   <div class="arrow">↓</div>
                   <div class="time">
                     ${flight.arrivalTime}<br>
                     <span>터미널${flight.arrivalTerminal}</span>
                   </div>
                 </div>
                 <div class="flight-details">
                   <div class="flight-info">${flight.flightNo}<br>
                     <span>K${flight.airplaneNo}</span>
                   </div>
                     
                     <c:choose>
					  <c:when test="${param.classType == 'eco-spec' || param.classType == 'eco-norm' || param.classType == 'buis' || param.classType == 'first'}">
					    <div class="fare-options">
					      <label class="fare" for="arrFareType${status.index + 1}-saver" data-seat-available="${flight.seatRemain}">
					        <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="saver" style="display:none;" />
					        <div class="content">
					          <div class="type">セイバー</div>
					          <div class="price">${saverPrice}円</div>
					          <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
					        </div>
					      </label>
					      
					      <label class="fare" for="arrFareType${status.index + 1}-standard" data-seat-available="${flight.seatRemain}">
					        <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="standard" style="display:none;" />
					        <div class="content">
					          <div class="type">スタンダード</div>
					          <div class="price">${standardPrice}円</div>
					          <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
					        </div>
					      </label>
					      
					      <label class="fare" for="arrFareType${status.index + 1}-flex" data-seat-available="${flight.seatRemain}">
					        <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="flex" style="display:none;" />
					        <div class="content">
					          <div class="type">フレックス</div>
					          <div class="price">${flexPrice}円</div>
					          <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
					        </div>
					      </label>
					    </div>
					  </c:when>
					  <c:otherwise>
					    <p>座席クラスが選択されていません。</p>
					  </c:otherwise>
					</c:choose>

                   </div>
                 </div>
               </div>
             </c:forEach>
           </div>
         </div>
         </c:if>

            <!-- 제출 버튼 -->
            <div class="confirm-button">
               <button type="submit">예약 확인</button>
            </div>

         </form>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
      <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>

      <script>
      document.addEventListener("DOMContentLoaded", function () {
         // 출국편 라디오 버튼 처리
         const departureRadios = document.querySelectorAll('input[name="depFareType"]');
         departureRadios.forEach(radio => {
           radio.addEventListener("change", () => {
             departureRadios.forEach(r => {
               const label = r.closest("label");
               if (label) label.classList.toggle("selected", r.checked);
             });
           });
         });

         // 귀국편 라디오 버튼 처리
         const arrivalRadios = document.querySelectorAll('input[name="arrFareType"]');
         arrivalRadios.forEach(radio => {
           radio.addEventListener("change", () => {
              arrivalRadios.forEach(r => {
               const label = r.closest("label");
               if (label) label.classList.toggle("selected", r.checked);
             });
           });
         });
       });

         // 버튼 스타일 업데이트
         function selectSeatType(type) {
            currentSeatType = type;
            document.getElementById("seatTypeInput").value = type;
            togglearrivalDate(type); 
            initFlatpickr(type);
         }
      </script>

      <script>
         // 항공편 종류 버튼 selected
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
            togglearrivalDate(type);
            initFlatpickr(type);
         }
      </script>
      
      <script>
      //인원이 좌석 수 보다 많을 경우 선택 안됨
      document.addEventListener("DOMContentLoaded", function () {
        const totalPassengerCount = 
          parseInt("${param.adultCount}") + 
          parseInt("${param.childCount}") + 
          parseInt("${param.infantCount}");
      
        document.querySelectorAll(".fare").forEach(label => {
          const seatAvailable = parseInt(label.dataset.seatAvailable || "0");
      
          if (seatAvailable < totalPassengerCount) {
            label.classList.add("readonly");
            const input = label.querySelector("input");
            if (input) input.readonly = true;
          }
        });
      });
      </script>
   </body>
</html>
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
      <form action="/reservationConfirm" method="post" class="reservation-form">
   
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
            <!-- 출국편 1 -->
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
                     <div class="economy">
                        <label class="fare" for="fareType1-saver">
                    <input id="fareType1-saver" type="radio" name="departureFare" value="セイバー" data-price="16200" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">16200円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType1-standard">
                              <input id="fareType1-standard" type="radio" name="departureFare" value="スタンダード" data-price="20600" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">20600円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType1-flux">
                              <input id="fareType1-flux" type="radio" name="departureFare" value="フラックス" data-price="37000" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">37000円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
               <!-- 출국편 2 -->
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
                     <div class="economy">
                        <label class="fare" for="fareType2-saver">
                    <input id="fareType2-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">16200円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType2-standard">
                              <input id="fareType2-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">20600円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType2-flux">
                              <input id="fareType2-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">37000円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
               
               <!-- 출국편 3 -->
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
                     <div class="economy">
                        <label class="fare" for="fareType3-saver">
                    <input id="fareType3-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">16200円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType3-standard">
                              <input id="fareType3-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">20600円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType3-flux">
                              <input id="fareType3-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">37000円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
               
               <!-- 출국편 4 -->
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
                     <div class="economy">
                        <label class="fare" for="fareType4-saver">
                    <input id="fareType4-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">16200円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType4-standard">
                              <input id="fareType4-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">20600円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="fareType4-flux">
                              <input id="fareType4-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">37000円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
            </div>
          </div>
          
            <!-- 귀국편 -->
            <c:if test="${param.tripType eq 'round'}">
            <div class="flight-section">
           <div class="section-title">帰国便</div>
            <div class="flight-options">
            
            <!-- 귀국편 1 -->
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
                     <div class="economy">
                        <label class="fare" for="arrivalFareType1-saver">
                              <input id="arrivalFareType1-saver" type="radio" name="arrivalFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">12500円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType1-standard">
                              <input id="arrivalFareType1-standard" type="radio" name="arrivalFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">19100円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType1-flux">
                              <input id="arrivalFareType1-flux" type="radio" name="arrivalFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">35700円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
            <!-- 귀국편 2 -->
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
                     <div class="economy">
                        <label class="fare" for="arrivalFareType2-saver">
                              <input id="arrivalFareType2-saver" type="radio" name="arrivalFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">12500円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType2-standard">
                              <input id="arrivalFareType2-standard" type="radio" name="arrivalFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">19100円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType2-flux">
                              <input id="arrivalFareType2-flux" type="radio" name="arrivalFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">35700円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
               
            <!-- 귀국편 3 -->
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
                     <div class="economy">
                        <label class="fare" for="arrivalFareType3-saver">
                              <input id="arrivalFareType3-saver" type="radio" name="arrivalFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">12500円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType3-standard">
                              <input id="arrivalFareType3-standard" type="radio" name="arrivalFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">19100円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType3-flux">
                              <input id="arrivalFareType3-flux" type="radio" name="arrivalFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">35700円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>
            <!-- 귀국편 4 -->
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
                     <div class="economy">
                        <label class="fare" for="arrivalFareType4-saver">
                              <input id="arrivalFareType4-saver" type="radio" name="arrivalFare" value="セイバー" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">12500円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType4-standard">
                              <input id="arrivalFareType4-standard" type="radio" name="arrivalFare" value="スタンダード" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">19100円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                  
                  <label class="fare" for="arrivalFareType4-flux">
                              <input id="arrivalFareType4-flux" type="radio" name="arrivalFare" value="フラックス" style="display:none;" />
                    <div class="content">
                      <div class="type">フラックス</div>
                      <div class="price">35700円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.SeatTotal}席</div>
                    </div>
                  </label>
                     </div>
                  </div>
               </div>

               
               </div>
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
         const departureRadios = document.querySelectorAll('input[name="departureFare"]');
         departureRadios.forEach(radio => {
           radio.addEventListener("change", () => {
             departureRadios.forEach(r => {
               const label = r.closest("label");
               if (label) label.classList.toggle("selected", r.checked);
             });
           });
         });

         // 귀국편 라디오 버튼 처리
         const arrivalRadios = document.querySelectorAll('input[name="arrivalFare"]');
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
   </body>
</html>


<%--  
            <!-- 예약 폼 -->
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
            
            <button type="submit">조회</button>
            --%>

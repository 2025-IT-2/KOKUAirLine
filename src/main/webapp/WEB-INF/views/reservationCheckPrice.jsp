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
                        <label class="fare">
						  <input type="radio" name="fareType1" value="セイバー" hidden />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">16200円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
						
						<label class="fare">
						  <input type="radio" name="fareType1" value="スタンダード" hidden />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">20600円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
						
						<label class="fare">
						  <input type="radio" name="fareType1" value="フラックス" hidden />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">37000円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
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
                        <label class="fare">
                       	<input type="radio" name="fareType2" value="セイバー" hidden />
                       	<div class="content">
                           <div class="type">セイバー</div>
                           <div class="price">13000円</div>
                           <div class="seats">15席</div>
                        </div>
                        </label>
                        <label class="fare">
                       	<input type="radio" name="fareType2" value="スタンダード" hidden />
                       	<div class="content">
                           <div class="type">スタンダード</div>
                           <div class="price">15000円</div>
                           <div class="seats">5席</div>
                        </div>
                        </label>
                        <label class="fare">
                       	<input type="radio" name="fareType2" value="フラックス" hidden />
                       	<div class="content">
                           <div class="type">フラックス</div>
                           <div class="price">32000円</div>
                           <div class="seats">4席</div>
                        </div>
                        </label>
                     </div>
                  </div>
               </div>
            </div>

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
         // 항공편 종류 버튼 selected
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
            toggleReturnDate(type);
            initFlatpickr(type);
         }
      </script>
   </body>
</html>

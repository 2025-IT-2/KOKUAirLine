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
	   <form action="/reservation" method="post" class="reservation-form">
	
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

            
            
            <div class="flights-container">
            <!-- 출국편 -->
            <div class="flight-section">
			  <div class="section-title">出国便</div>
            <div class="flight-options">
               <div class="flight">
                  <div class="time-info">
                     <div class="time">8:50<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">11:15<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="fareType1-saver">
						  <input id="fareType1-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">16200円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType1-standard">
                              <input id="fareType1-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">20600円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType1-flux">
                              <input id="fareType1-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
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
                     <div class="time">10:20<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">13:05<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="fareType2-saver">
						  <input id="fareType2-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
                       	<div class="content">
                           <div class="type">セイバー</div>
                           <div class="price">13000円</div>
                           <div class="seats">15席</div>
                        </div>
                        </label>
                        <label class="fare" for="fareType2-standard">
                              <input id="fareType2-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
                       	<div class="content">
                           <div class="type">スタンダード</div>
                           <div class="price">15000円</div>
                           <div class="seats">5席</div>
                        </div>
                        </label>
                        <label class="fare" for="fareType2-flux">
                              <input id="fareType2-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
                       	<div class="content">
                           <div class="type">フラックス</div>
                           <div class="price">32000円</div>
                           <div class="seats">4席</div>
                        </div>
                        </label>
                     </div>
                  </div>
                  </div>
                  
                  <div class="flight">
                  <div class="time-info">
                     <div class="time">15:20<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">17:50<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="fareType3-saver">
						  <input id="fareType3-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">14400円</div>
						    <div class="seats">8席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType3-standard">
                              <input id="fareType3-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">16600円</div>
						    <div class="seats">4席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType3-flux">
                              <input id="fareType3-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">36400円</div>
						    <div class="seats">4席</div>
						  </div>
						</label>
                     </div>
                  </div>
               </div>
               
               <div class="flight">
                  <div class="time-info">
                     <div class="time">15:20<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">17:50<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="fareType4-saver">
						  <input id="fareType4-saver" type="radio" name="departureFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">16000円</div>
						    <div class="seats">3席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType4-standard">
                              <input id="fareType4-standard" type="radio" name="departureFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">19400円</div>
						    <div class="seats">9席</div>
						  </div>
						</label>
						
						<label class="fare" for="fareType4-flux">
                              <input id="fareType4-flux" type="radio" name="departureFare" value="フラックス" style="display:none;" />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">35500円</div>
						    <div class="seats">5席</div>
						  </div>
						</label>
                     </div>
                  </div>
               </div>
               </div>
            </div>
            
            <div class="flight-section">
			  <div class="section-title">帰国便</div>
            <div class="flight-options">
               <div class="flight">
                  <div class="time-info">
                     <div class="time">07:10<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">09:45<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="returnFareType1-saver">
                              <input id="returnFareType1-saver" type="radio" name="returnFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">12500円</div>
						    <div class="seats">2席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType1-standard">
                              <input id="returnFareType1-standard" type="radio" name="returnFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">19100円</div>
						    <div class="seats">13席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType1-flux">
                              <input id="returnFareType1-flux" type="radio" name="returnFare" value="フラックス" style="display:none;" />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">35700円</div>
						    <div class="seats">3席</div>
						  </div>
						</label>
                     </div>
                  </div>
               </div>

               <div class="flight">
                  <div class="time-info">
                     <div class="time">11:05<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">13:30<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="returnFareType2-saver">
                              <input id="returnFareType2-saver" type="radio" name="returnFare" value="セイバー" style="display:none;" />
                       	<div class="content">
                           <div class="type">セイバー</div>
                           <div class="price">14700円</div>
                           <div class="seats">12席</div>
                        </div>
                        </label>
                        <label class="fare" for="returnFareType2-standard">
                              <input id="returnFareType2-standard" type="radio" name="returnFare" value="スタンダード" style="display:none;" />
                       	<div class="content">
                           <div class="type">スタンダード</div>
                           <div class="price">18800円</div>
                           <div class="seats">11席</div>
                        </div>
                        </label>
                        <label class="fare" for="returnFareType2-flux">
                              <input id="returnFareType2-flux" type="radio" name="returnFare" value="フラックス" style="display:none;" />
                       	<div class="content">
                           <div class="type">フラックス</div>
                           <div class="price">35100円</div>
                           <div class="seats">2席</div>
                        </div>
                        </label>
                     </div>
                  </div>
               </div>
               
               <div class="flight">
                  <div class="time-info">
                     <div class="time">14:55<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">17:25<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="returnFareType3-saver">
                              <input id="returnFareType3-saver" type="radio" name="returnFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">15100円</div>
						    <div class="seats">6席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType3-standard">
                              <input id="returnFareType3-standard" type="radio" name="returnFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">18500円</div>
						    <div class="seats">5席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType3-flux">
                              <input id="returnFareType3-flux" type="radio" name="returnFare" value="フラックス" style="display:none;" />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">36800円</div>
						    <div class="seats">8席</div>
						  </div>
						</label>
                     </div>
                  </div>
               </div>
               
               <div class="flight">
                  <div class="time-info">
                     <div class="time">14:55<br><span>터미널1</span></div>
                     <div class="arrow">↓</div>
                     <div class="time">17:25<br><span>터미널1</span></div>
                  </div>
                  <div class="flight-details">
                     <div class="flight-info">OZ172<br>A320</div>
                     <div class="economy">
                        <label class="fare" for="returnFareType4-saver">
                              <input id="returnFareType4-saver" type="radio" name="returnFare" value="セイバー" style="display:none;" />
						  <div class="content">
						    <div class="type">セイバー</div>
						    <div class="price">15100円</div>
						    <div class="seats">6席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType4-standard">
                              <input id="returnFareType4-standard" type="radio" name="returnFare" value="スタンダード" style="display:none;" />
						  <div class="content">
						    <div class="type">スタンダード</div>
						    <div class="price">19900円</div>
						    <div class="seats">12席</div>
						  </div>
						</label>
						
						<label class="fare" for="returnFareType4-flux">
                              <input id="returnFareType4-flux" type="radio" name="returnFare" value="フラックス" style="display:none;" />
						  <div class="content">
						    <div class="type">フラックス</div>
						    <div class="price">35100円</div>
						    <div class="seats">14席</div>
						  </div>
						</label>
                     </div>
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
    	  const returnRadios = document.querySelectorAll('input[name="returnFare"]');
    	  returnRadios.forEach(radio => {
    	    radio.addEventListener("change", () => {
    	      returnRadios.forEach(r => {
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

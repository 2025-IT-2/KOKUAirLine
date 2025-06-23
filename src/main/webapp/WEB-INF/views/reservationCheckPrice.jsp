<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
            <c:forEach var="flightwP" items="${flightsWithPrice}" varStatus="status">
              <div class="flight">
                <div class="time-info">
                  <div class="time">
                    ${flightwP.flight.departureTime}<br>
                    <span>터미널${flightwP.flight.departureTerminal}</span>
                  </div>
                  <div class="arrow">↓</div>
                  <div class="time">
                    ${flightwP.flight.arrivalTime}<br>
                    <span>터미널${flightwP.flight.arrivalTerminal}</span>
                  </div>
                </div>
                <div class="flight-details">
                  <div class="flight-info">
                    ${flightwP.flight.flightNo}<br>
                    <span>K${flightwP.flight.airplaneNo}</span>
                  </div>

                  <div class="eco-spec">
                    <label class="fare" for="depFareType${status.index + 1}-saver" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-saver" type="radio" name="depFareType" value="${saverPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-standard" type="radio" name="depFareType" value="${standardPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-flex" type="radio" name="depFareType" value="${flexPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      
      <!-- 귀국편 -->
      <c:if test="${param.tripType eq 'round'}">
        <div class="flight-section">
          <div class="section-title">帰国便</div>
          <div class="flight-options">
            <c:forEach var="flightwP" items="${aflightsWithPrice}" varStatus="status">
              <div class="flight">
                <div class="time-info">
                  <div class="time">
                    ${flightwP.flight.departureTime}<br>
                    <span>터미널${flightwP.flight.departureTerminal}</span>
                  </div>
                  <div class="arrow">↓</div>
                  <div class="time">
                    ${flightwP.flight.arrivalTime}<br>
                    <span>터미널${flightwP.flight.arrivalTerminal}</span>
                  </div>
                </div>
                <div class="flight-details">
                  <div class="flight-info">
                    ${flightwP.flight.flightNo}<br>
                    <span>K${flightwP.flight.airplaneNo}</span>
                  </div>

                  <div class="eco-spec">
                    <label class="fare" for="arrFareType${status.index + 1}-saver" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice * flightwP.price}" style="display:none;" />
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}席</div>
                      </div>
                    </label>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </c:if>
    </div>


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
              <c:when test="${param.classType == 'eco-spec'}">
                <div class="eco-spec">
                  <label class="fare" for="arrFareType${status.index + 1}-saver"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice}" data-price="16200" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">${saverPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-standard"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice}" data-price="18400" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">${standardPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-flex"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice}" data-price="21900" style="display:none;" />
                    <div class="content">
                      <div class="type">フレックス</div>
                      <div class="price">${flexPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>
                </div>
              </c:when>

              <c:when test="${param.classType == 'eco-norm'}">
                <div class="eco-spec">
                  <label class="fare" for="arrFareType${status.index + 1}-saver"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice}" data-price="16200" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">${saverPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-standard"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice}" data-price="18400" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">${standardPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-flex"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice}" data-price="21900" style="display:none;" />
                    <div class="content">
                      <div class="type">フレックス</div>
                      <div class="price">${flexPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>
                </div>
              </c:when>
              
              <c:when test="${param.classType == 'buis'}">
                <div class="eco-spec">
                  <label class="fare" for="arrFareType${status.index + 1}-saver"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice}" data-price="16200" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">${saverPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-standard"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice}" data-price="18400" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">${standardPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-flex"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice}" data-price="21900" style="display:none;" />
                    <div class="content">
                      <div class="type">フレックス</div>
                      <div class="price">${flexPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>
                </div>
              </c:when>
              
              <c:when test="${param.classType == 'first'}">
                <div class="eco-spec">
                  <label class="fare" for="arrFareType${status.index + 1}-saver"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice}" data-price="16200" style="display:none;" />
                    <div class="content">
                      <div class="type">セイバー</div>
                      <div class="price">${saverPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-standard"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice}" data-price="18400" style="display:none;" />
                    <div class="content">
                      <div class="type">スタンダード</div>
                      <div class="price">${standardPrice}円</div>
                      <div class="seats">${flight.seatRemain} / ${flight.seatTotal}席</div>
                    </div>
                  </label>

                  <label class="fare" for="arrFareType${status.index + 1}-flex"
                        data-seat-available="${flight.seatRemain}">
                    <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice}" data-price="21900" style="display:none;" />
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



 
 
 
            
	        <!-- ✅ 누락된 필수 파라미터 hidden input으로 추가 -->
			<input type="hidden" name="adultCount" value="${param.adultCount}" />
			<input type="hidden" name="childCount" value="${param.childCount}" />
			<input type="hidden" name="infantCount" value="${param.infantCount}" />
			<input type="hidden" name="departureAirport" value="${param.departureAirport}" />
			<input type="hidden" name="arrivalAirport" value="${param.arrivalAirport}" />
			<input type="hidden" name="tripType" value="${param.tripType}" />
			<input type="hidden" name="departureDate" value="${param.departureDate}" />
			<input type="hidden" name="arrivalDate" value="${param.arrivalDate}" />
			<input type="hidden" name="classType" value="${param.classType}" />
			<input type="hidden" id="totalPrice" name="totalPrice" value="" />



            <!-- 제출 버튼 -->
            <div class="confirm-button">
               <button type="submit">예약 확인</button>
            </div>

         </form>
   </div>

</body>


		<script>
		document.addEventListener("DOMContentLoaded", function () {
		  const allFareRadios = document.querySelectorAll('input[name="depFareType"], input[name="arrFareType"]');
		
		  allFareRadios.forEach(radio => {
		    radio.addEventListener("change", () => {
		      let total = 0;
		
		      // 출국편 가격
		      const selectedDep = document.querySelector('input[name="depFareType"]:checked');
		      if (selectedDep) {
		        total += parseInt(selectedDep.dataset.price || "0");
		      }
		
		      // 귀국편 가격 (왕복일 경우만 체크됨)
		      const selectedArr = document.querySelector('input[name="arrFareType"]:checked');
		      if (selectedArr) {
		        total += parseInt(selectedArr.dataset.price || "0");
		      }
		
		      // 합산한 totalPrice를 hidden input에 저장
		      document.getElementById("totalPrice").value = total;
		    });
		  });
		});
		</script> 



</html>

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
      <form action="/passengerInfo" method="post"> 
   
      <div class="info-bar">
         <div class="info-box triptype">
            <span class="info-text">
              <c:choose>
                <c:when test="${param.tripType eq 'round'}">
                	<ruby class="taxfree-t"><rb>往復</rb><rt>おうふく</rt></ruby>
                </c:when>
                <c:when test="${param.tripType eq 'oneway'}">
                	<ruby class="taxfree-t"><rb>片道</rb><rt>かたみち</rt></ruby>
                </c:when>
                <c:when test="${param.tripType eq 'multiway'}">
                	<ruby class="taxfree-t"><rb>多区間</rb><rt>たくかん</rt></ruby>
                </c:when>
                <c:otherwise>
                	<ruby class="taxfree-t"><rb>未選択</rb><rt>みせんたく</rt></ruby>
                </c:otherwise>
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
               <ruby class="taxfree-t"><rb>大人</rb><rt>おとな</rt></ruby> ${param.adultCount}・
               <ruby class="taxfree-t"><rb>小児</rb><rt>しょうに</rt></ruby> ${param.childCount}・
               <ruby class="taxfree-t"><rb>幼児</rb><rt>ようじ</rt></ruby> ${param.infantCount}
            </span>
         </div>
         
         <input type="hidden" name="timeCategory" value="morning" />
         
         <div class="info-box seat-type">
            <c:choose>
            <c:when test="${param.classType eq 'eco-spec'}">
            	エコノミー<ruby class="taxfree-t"><rb>特価</rb><rt>とっか</rt></ruby>
            </c:when>
            <c:when test="${param.classType eq 'eco-norm'}">
            	エコノミー<ruby class="taxfree-t"><rb>一般</rb><rt>いっぱん</rt></ruby>
            </c:when>
            <c:when test="${param.classType eq 'buis'}">ビジネス</c:when>
            <c:when test="${param.classType eq 'first'}">ファースト</c:when>
            <c:otherwise>
            	<ruby class="taxfree-t"><rb>未選択</rb><rt>みせんたく</rt></ruby>
            </c:otherwise>
            </c:choose>
         </div>
      </div>

      <div class="flights-container">
        <!-- 출국편 -->
        <div class="flight-section">
          <div class="section-title">
          	<ruby class="taxfree-t"><rb>出国便</rb><rt>しゅっこくびん</rt></ruby>
          </div>
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
                      <input id="depFareType${status.index + 1}-saver" type="radio" name="depFareType" value="${saverPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}" />
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-standard" type="radio" name="depFareType" value="${standardPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-flex" type="radio" name="depFareType" value="${flexPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
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
          <div class="section-title">
          <ruby class="taxfree-t"><rb>帰国便</rb><rt>きこくびん</rt></ruby>
          </div>
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
                      <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby class="taxfree-t"><rb>席</rb><rt>せき</rt></ruby>
                        </div>
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
            
	    <!-- 필수 파라미터 hidden input으로 추가 -->
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
			<input type="hidden" name="selectedFlightNo" value="${param.selectedFlightNo}" />
			<input type="hidden" name="arrivalFlightNo" value="${param.arrivalFlightNo}" />
			<input type="hidden" name="flightMealYN" value="Y" />
			<input type="hidden" name="depAirFare" id="depAirFare" />
			<input type="hidden" name="arrAirFare" id="arrAirFare" /> 

            <!-- 제출 버튼 -->
            <div class="confirm-button">
               <button id="btnReserve" type="submit">예약 확인</button>
            </div>

         </form>
   </div>   

    <!-- 총액 계산 -->    
		<script>
		document.getElementById('btnReserve').addEventListener("click", function () {
			console.log(111);
		});
		
		
		document.addEventListener("DOMContentLoaded", function () {
			  const allFareRadios = document.querySelectorAll('input[name="depFareType"], input[name="arrFareType"]');

			  allFareRadios.forEach(radio => {
			    radio.addEventListener("change", () => {
			      let total = 0;

			      const selectedDep = document.querySelector('input[name="depFareType"]:checked');
			      if (selectedDep) {
			        total += parseInt(selectedDep.value || "0");
			      }

			      const selectedArr = document.querySelector('input[name="arrFareType"]:checked');
			      if (selectedArr) {
			        total += parseInt(selectedArr.value || "0");
			      }

			      document.getElementById("totalPrice").value = total;
			    });
			  });
			});
		
			document.addEventListener("DOMContentLoaded", function () {
			  const depRadios = document.querySelectorAll('input[name="depFareType"]');
			  const arrRadios = document.querySelectorAll('input[name="arrFareType"]');
			  
			  depRadios.forEach(radio => {
			    radio.addEventListener("change", function () {
			      document.getElementById("depAirFare").value = this.value;
			    });
			  });

			  arrRadios.forEach(radio => {
			    radio.addEventListener("change", function () {
			      document.getElementById("arrAirFare").value = this.value;
			    });
			  });
			});
		
		</script> 
		
		<script>
		  document.addEventListener("DOMContentLoaded", function () {
		    // 출발편 선택 시 처리
		    const depRadios = document.querySelectorAll('input[name="depFareType"]');
		    const selectedFlightNoInput = document.querySelector('input[name="selectedFlightNo"]');
		
		    depRadios.forEach(radio => {
		      radio.addEventListener("change", function () {
		        const flightNo = this.dataset.flightNo;
		        selectedFlightNoInput.value = flightNo;
		        console.log("✈️ 출발편 selectedFlightNo:", flightNo);
		      });
		    });
		
		    // 도착편 선택 시 처리
		    const arrRadios = document.querySelectorAll('input[name="arrFareType"]');
		    const arrivalFlightNoInput = document.querySelector('input[name="arrivalFlightNo"]');
		
		    arrRadios.forEach(radio => {
		      radio.addEventListener("change", function () {
		        const flightNo = this.dataset.flightNo;
		        arrivalFlightNoInput.value = flightNo;
		        console.log("✈️ 도착편 arrivalFlightNo:", flightNo);
		      });
		    });
		  });
		</script>
						
</body>

	


</html>

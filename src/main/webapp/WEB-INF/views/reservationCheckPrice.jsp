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
               <ruby><rb>大人</rb><rt>おとな</rt></ruby> ${param.adultCount}・
               <ruby><rb>小児</rb><rt>しょうに</rt></ruby> ${param.childCount}・
               <ruby><rb>幼児</rb><rt>ようじ</rt></ruby> ${param.infantCount}
            </span>
         </div>
         
         <input type="hidden" name="timeCategory" value="morning" />
         
         <div class="info-box seat-type">
            <c:choose>
            <c:when test="${param.classType eq 'eco-spec'}">
            	エコノミー<ruby><rb>特価</rb><rt>とっか</rt></ruby>
            </c:when>
            <c:when test="${param.classType eq 'eco-norm'}">
            	エコノミー<ruby><rb>一般</rb><rt>いっぱん</rt></ruby>
            </c:when>
            <c:when test="${param.classType eq 'buis'}">ビジネス</c:when>
            <c:when test="${param.classType eq 'first'}">ファースト</c:when>
            <c:otherwise>
            	<ruby><rb>未選択</rb><rt>みせんたく</rt></ruby>
            </c:otherwise>
            </c:choose>
         </div>
      </div>

      <div class="flights-container">
        <!-- 출국편 -->
        <div class="flight-section">
          <div class="section-title">
          	<ruby><rb>出国便</rb><rt>しゅっこくびん</rt></ruby>
          </div>
          <div class="flight-options">
            <c:forEach var="flightwP" items="${flightsWithPrice}" varStatus="status">
              <div class="flight">
                <div class="time-info">
                  <div class="time">
                    ${flightwP.flight.departureTime}<br>
                    <span>ターミナル${flightwP.flight.departureTerminal}</span>
                  </div>
                  <div class="arrow">↓</div>
                  <div class="time">
                    ${flightwP.flight.arrivalTime}<br>
                    <span>ターミナル${flightwP.flight.arrivalTerminal}</span>
                  </div> 
                </div>
                <div class="flight-details">
                  <div class="flight-info">
					<div id=flightNo>
						<p class="explain"><ruby><rb>空港編</rb><rt>くうこうへん</rt></p>
                    ${flightwP.flight.flightNo}</div>
					<div id=planeNo>
						<p class="explain"><ruby><rb>機種</rb><rt>きしゅ</rt></p>
                    <span>K${flightwP.flight.airplaneNo}</span></div>
                  </div>
                  

                  <div class="eco-spec">
                    <label class="fare" for="depFareType${status.index + 1}-saver" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-saver" type="radio" name="depFareType" value="${saverPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}" />
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-standard" type="radio" name="depFareType" value="${standardPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="depFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="depFareType${status.index + 1}-flex" type="radio" name="depFareType" value="${flexPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
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
          <ruby><rb>帰国便</rb><rt>きこくびん</rt></ruby>
          </div>
          <div class="flight-options">
            <c:forEach var="flightwP" items="${aflightsWithPrice}" varStatus="status">
              <div class="flight">
                <div class="time-info">
                  <div class="time">
                    ${flightwP.flight.departureTime}<br>
                    <span>ターミナル${flightwP.flight.departureTerminal}</span>
                  </div>
                  <div class="arrow">↓</div>
                  <div class="time">
                    ${flightwP.flight.arrivalTime}<br>
                    <span>ターミナル${flightwP.flight.arrivalTerminal}</span>
                  </div>
                </div>
                <div class="flight-details">
                  <div class="flight-info">
					<div id=flightNo>
							<p class="explain"><ruby><rb>空港編</rb><rt>くうこうへん</rt></p>
	                    ${flightwP.flight.flightNo}</div>
						<div id=planeNo>
							<p class="explain"><ruby><rb>機種</rb><rt>きしゅ</rt></p>
	                    <span>K${flightwP.flight.airplaneNo}</span></div>
                  </div>

                  <div class="eco-spec">
                    <label class="fare" for="arrFareType${status.index + 1}-saver" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-saver" type="radio" name="arrFareType" value="${saverPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">セイバー</div>
                        <div class="price"><fmt:formatNumber value="${saverPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-standard" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-standard" type="radio" name="arrFareType" value="${standardPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">スタンダード</div>
                        <div class="price"><fmt:formatNumber value="${standardPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
                        </div>
                      </div>
                    </label>

                    <label class="fare" for="arrFareType${status.index + 1}-flex" data-seat-available="${flightwP.flight.seatRemain}">
                      <input id="arrFareType${status.index + 1}-flex" type="radio" name="arrFareType" value="${flexPrice * flightwP.price}" style="display:none;" data-flight-no="${flightwP.flight.flightNo}"/>
                      <div class="content">
                        <div class="type">フレックス</div>
                        <div class="price"><fmt:formatNumber value="${flexPrice * flightwP.price}" type="number" maxFractionDigits="0" />円</div>
                        <div class="seats">${flightwP.flight.seatRemain} / ${flightwP.flight.seatTotal}
                        <ruby><rb>席</rb><rt>せき</rt></ruby>
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
			<input type="hidden" id="totalPrice" name="totalPrice" value="0" />
			<input type="hidden" name="selectedFlightNo" value="${param.selectedFlightNo}" />
			<input type="hidden" name="arrivalFlightNo" value="${param.arrivalFlightNo}" />
			<input type="hidden" name="flightMealYN" value="Y" />
			<input type="hidden" name="depAirFare" id="depAirFare" value="${param.depAirFare}" />
			<input type="hidden" name="arrAirFare" id="arrAirFare" value="${param.arrAirFare}" /> 

			

            <!-- 제출 버튼 -->
            <div class="confirm-button">
               <button id="btnReserve" type="submit"><ruby><rb>予約確認</rb><rt>よやくかくにん</rt></ruby></button>

            </div>


         </form>
   </div>   

	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const depRadios = document.querySelectorAll('input[name="depFareType"]');
	    const arrRadios = document.querySelectorAll('input[name="arrFareType"]');
	
	    const depAirFareInput = document.getElementById("depAirFare");
	    const arrAirFareInput = document.getElementById("arrAirFare");
	    const totalPriceInput = document.getElementById("totalPrice");
	    const selectedFlightNoInput = document.querySelector('input[name="selectedFlightNo"]');
	    const arrivalFlightNoInput = document.querySelector('input[name="arrivalFlightNo"]');
	
	    // 운임 선택 시 값 갱신 함수
	    function updateFareAndFlightInfo() {
	      let depFare = 0;
	      let arrFare = 0;
	
	      const selectedDep = document.querySelector('input[name="depFareType"]:checked');
	      if (selectedDep) {
	        depFare = Math.floor(parseFloat(selectedDep.value || "0"));
	        depAirFareInput.value = depFare;
	        selectedFlightNoInput.value = selectedDep.dataset.flightNo || "";
	      }
	
	      const selectedArr = document.querySelector('input[name="arrFareType"]:checked');
	      if (selectedArr) {
	        arrFare = Math.floor(parseFloat(selectedArr.value || "0"));
	        arrAirFareInput.value = arrFare;
	        arrivalFlightNoInput.value = selectedArr.dataset.flightNo || "";
	      }
	
	      totalPriceInput.value = depFare + arrFare;
	    }
	
	    // 각각의 라디오 버튼에 change 이벤트 연결
	    [...depRadios, ...arrRadios].forEach(radio => {
	      radio.addEventListener("change", updateFareAndFlightInfo);
	    });
	
	    // 제출 버튼 처리
	    document.getElementById('btnReserve').addEventListener("click", function (e) {
	      e.preventDefault(); // 기본 submit 막기
	
	      updateFareAndFlightInfo(); // 값 갱신
	
	      // 로그 출력
	      console.log("✈️ depAirFare:", depAirFareInput.value);
	      console.log("✈️ arrAirFare:", arrAirFareInput.value);
	      console.log("💰 totalPrice:", totalPriceInput.value);
	      console.log("🛫 selectedFlightNo:", selectedFlightNoInput.value);
	      console.log("🛬 arrivalFlightNo:", arrivalFlightNoInput.value);
	
	      // 폼 직접 제출
	      document.querySelector("form").submit();
	    });
	  });
	</script>


	<%@ include file="footer.jsp" %>
						
</body>

</html>

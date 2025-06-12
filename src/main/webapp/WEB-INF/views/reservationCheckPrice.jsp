<%@ page contentType="text/html; charset=UTF-8" %>
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
	</script>
	
	<script>
	// 버튼 스타일 업데이트
	function selectTripType(type) {
		currentTripType = type;
		
		document.querySelectorAll(".trip-option").forEach(btn => {
			btn.classList.remove("selected");
			if (btn.dataset.type ===type) {
				btn.classList.add("selected");					
			}
		});
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

<div class="screen">
    <div class="overlap">

        <!-- 배경 박스 
        <div class="background-box"></div>

         상단 바 
        <div class="top-bar"></div>-->

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

        <!-- 노선 정보 -->
        <p class="route-title">ICN 인천 &gt; ${arrival}</p>

        <!-- 출발일 -->
        <div class="date-box">${travelDate}</div>

        <!-- 예약 폼 -->
        <form action="/confirmReservation" method="post" class="reservation-form">

            <!-- 운항 시간 -->
            <div class="form-section">
                <label for="flightTime">운항 시간 선택:</label>
                <select name="flightTime" id="flightTime">
                    <c:forEach var="f" items="${flightList}">
                        <option value="${f.flightTime}">${f.flightTime}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- 좌석 타입 -->
            <div class = "container">
	        <h2>旅程/日付選択</h2>
	        <div class = "trip-type" id = tripType>
	            <button class = "trip-option selected" data-type = "round" onclick = "selectTripType('round')">往復</button>
	            <button class = "trip-option" data-type = "oneway" onclick = "selectTripType('oneway')">片道</button>
	            <button class = "trip-option" data-type = "multiway" onclick = "selectTripType('multiway')">多区間</button>
	        </div>
            
            
            <div class="form-section">
                <label for="seatType">좌석 타입 선택:</label>
                <select name="seatType" id="seatType">
                    <option value="economy">이코노미</option>
                    <option value="business">비즈니스</option>
                    <option value="first">퍼스트</option>
                </select>
            </div>

            <!-- 숨겨진 값 -->
            <input type="hidden" name="departure" value="${departure}" />
            <input type="hidden" name="arrival" value="${arrival}" />
            <input type="hidden" name="tripType" value="${tripType}" />

            <!-- 제출 버튼 -->
            <div class="form-section">
                <button type="submit">예약 확인</button>
            </div>

        </form>
    </div>
</div>

</body>
</html>

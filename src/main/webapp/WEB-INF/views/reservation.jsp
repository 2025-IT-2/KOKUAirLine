<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function () {
	    	let currentTripType = 'round';
	    	let datepickerInstance;

	   		// 항공편 선택
		    const tripButtons = document.querySelectorAll(".trip-option");
		    tripButtons.forEach(button => {
		        button.addEventListener("click", () => {
		            tripButtons.forEach(btn => btn.classList.remove("selected"));
		            button.classList.add("selected");
		            selectTripType(button.dataset.type);
		        });
		    });
	
		    // 클래스 선택
		    const classButtons = document.querySelectorAll(".class-option");
		    classButtons.forEach(btn => {
		        btn.addEventListener("click", () => {
		            document.getElementById("classTypeInput").value = btn.dataset.type;
		            classButtons.forEach(btn => btn.classList.remove("selected"));
		            btn.classList.add("selected");
		        });
		    });
	
		    // 탑승객 카운터
		    const counters = document.querySelectorAll(".counter");
		    counters.forEach((counter, index) => {
		        const minus = counter.querySelector("button:first-child");
		        const plus = counter.querySelector("button:last-child");
		        const value = counter.querySelector("span");
	
		        minus.addEventListener("click", () => {
		            let current = parseInt(value.textContent);
		            if (current > 0) {
		                value.textContent = current - 1;
		                updatePassengerCounts();
		            }
		        });
	
		        plus.addEventListener("click", () => {
		            let current = parseInt(value.textContent);
		            value.textContent = current + 1;
		            updatePassengerCounts();
		        });
		    });
	
		    // 날짜 선택 초기화
		    toggleArrivalDate(currentTripType);
		    initFlatpickr(currentTripType);
	
		    // 유효성 검사
		    document.querySelector("form").addEventListener("submit", function (e) {
		        const classType = document.getElementById("classTypeInput").value;
		        if (!classType) {
		            alert("座席クラスを選択してください。");
		            e.preventDefault();
		        }
	
		        const adult = parseInt(document.getElementById("adultCount").value);
		        const child = parseInt(document.getElementById("childCount").value);
		        const infant = parseInt(document.getElementById("infantCount").value);
	
		        if (adult + child + infant === 0) {
		            alert("搭乗人員を1人以上選択してください。");
		            e.preventDefault();
		        }
		    });
	
		    // 함수 정의들
		    function selectTripType(type) {
		        currentTripType = type;
		        document.getElementById("tripTypeInput").value = type;
		        toggleArrivalDate(type);
		        initFlatpickr(type);
		    }
	
		    function toggleArrivalDate(type) {
		        const returnInput = document.getElementById("arrivalDate");
		        if (type === "round") {
		            returnInput.style.display = "inline-block";
		        } else {
		            returnInput.style.display = "none";
		            returnInput.value = "";
		        }
		    }
	
		    function updatePassengerCounts() {
		        const counts = document.querySelectorAll(".counter span");
		        document.getElementById("adultCount").value = counts[0].textContent;
		        document.getElementById("childCount").value = counts[1].textContent;
		        document.getElementById("infantCount").value = counts[2].textContent;
		    }
	
		    function initFlatpickr(type) {
		        if (datepickerInstance) {
		            datepickerInstance.destroy();
		        }
	
		        if (type === "multiway") return;
	
		        const baseOptions = {
		            minDate: "today",
		            dateFormat: "Y.m.d",
		            locale: "ja",
		            onChange: function (selectedDates) {
		                if (type === "round" && selectedDates.length === 2) {
		                    const [start, end] = selectedDates;
		                    if (start.getTime() === end.getTime()) {
		                        alert("出発日と帰国日は同じにできません。");
		                        document.getElementById("departureDate").value = "";
		                        document.getElementById("arrivalDate").value = "";
		                    }
		                }
		            }
		        };
	
		        if (type === "round") {
		            datepickerInstance = flatpickr("#departureDate", {
		                ...baseOptions,
		                mode: "range",
		                plugins: [new rangePlugin({ input: "#arrivalDate" })]
		            });
		        } else if (type === "oneway") {
		            datepickerInstance = flatpickr("#departureDate", {
		                ...baseOptions,
		                mode: "single"
		            });
		        }
		    }
		});
	</script>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="utf-8" />
		<link rel="stylesheet" href="<c:url value='/css/global.css' />" />
		<link rel="stylesheet" href="<c:url value='/css/reservation.css'/>"/>
		<link rel="stylesheet" href="<c:url value='/css/header.css'/>"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<title>航空券検索</title>
	</head>
	<body>
		<form method = "post" action = "reservationCheckPrice">
	    <div class = "container">
	    	<div class = "reservation-container">
	        <h2>旅程/日付選択</h2>
			<!-- 여행 종류 선택 -->
	        <div class = "trip-type" id = tripType>
	            <button type="button" class = "trip-option selected" data-type = "round">往復</button>
	            <button type="button" class = "trip-option" data-type = "oneway">片道</button>
	            <button type="button" class = "trip-option" data-type = "multiway">多区間</button>
	        </div>
	        <input type = "hidden" name = "tripType" id = "tripTypeInput" value = "round">
			<!-- 공항 선택 -->
			<div class = "airport-selection">
				<select name="departureAirport" id = "departureAirport" class = "airport-select">
				    <c:forEach var="airport" items="${airports}">
				    	<c:if test="${airport.airportCode == 'NRT'}">
	            			<option selected>${airport.airportJp} / ${airport.airportCode}</option>
	       				</c:if>
				    </c:forEach>
				    <c:forEach var="airport" items="${airports}" varStatus = "status">
	       				<c:if test="${airport.airportCode != 'NRT' && status.count <= 4}">
			    	        <option >${airport.airportJp} / ${airport.airportCode}</option>
	        			</c:if>
				    </c:forEach>
				</select>
				<select name="arrivalAirport" id = "arrivalAirport" class = "airport-select">		    
				    <c:forEach var="airport" items="${airports}">
					    <c:if test="${airport.airportCode == 'MNL'}">
					        <option selected>${airport.airportJp} / ${airport.airportCode}</option>
					    </c:if>
					</c:forEach>
					<c:forEach var="airport" items="${airports}">
					    <c:if test="${airport.airportCode == 'NRT'}">
					        <option>${airport.airportJp} / ${airport.airportCode}</option>
					    </c:if>
					</c:forEach>
				    <c:forEach var="airport" items="${airports}" varStatus="status">
					    <c:if test="${airport.airportCode != 'NRT' && airport.airportCode != 'MNL' && status.count <= 4}">
					        <option>${airport.airportJp} / ${airport.airportCode}</option>
					    </c:if>
					</c:forEach>
				</select>
	        	<input type="text" id="departureDate" name = "departureDate" class="date-input" placeholder="出発日を選択">
	        	<input type="text" id="arrivalDate" name = "arrivalDate" class="date-input" placeholder="帰りの日を選択">
			</div>
			<!-- 탑승객 선택 -->
	        <h3>搭乗人員選択</h3>
	        <div class = "passengers">
	            <div class = "passenger-type">
	                <label>大人（12歳以上）</label>
	                <div class = "counter">
	                    <button type = "button">-</button>
	                    <span>0</span>
	                    <button type = "button">+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>小児（2歳〜12歳未満）</label>
	                <div class = "counter">
	                    <button type = "button">-</button>
	                    <span>0</span>
	                    <button type = "button">+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>幼児（2歳未満）</label>
	                <div class = "counter">
	                    <button type = "button">-</button>
	                    <span>0</span>
	                    <button type = "button">+</button>
	                </div>
	            </div>
	        </div>
			<input type = "hidden" name = "adultCount" id = "adultCount" value = "0">
			<input type = "hidden" name = "childCount" id = "childCount" value = "0">
			<input type = "hidden" name = "infantCount" id = "infantCount" value = "0">
			<!-- 클래스 선택 -->	
	        <h3>座席クラス選択</h3>
	        <div class = "class-type">
	            <button type="button" class = "class-option" data-type = "eco-spec">エコノミー特価</button>
	            <button type="button" class = "class-option" data-type = "eco-norm">エコノミー一般</button>
	            <button type="button" class = "class-option" data-type = "buis">ビジネス</button>
	            <button type="button" class = "class-option" data-type = "first">ファースト</button>
	        </div>
	        <input type = "hidden" name = "classType" id = "classTypeInput" value = "">
	        <div class = "confirm-button">
	            <button type = "submit">航空券検索</button>
	        </div>
	    </div>
	    </div>
		</form>
	</body>
</html>

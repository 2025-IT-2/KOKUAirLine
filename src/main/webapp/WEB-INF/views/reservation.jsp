<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
	<script> // 좌석 종류 버튼 selected
		document.addEventListener("DOMContentLoaded", function () {
		    const classButtons = document.querySelectorAll(".class-option");
		
		    classButtons.forEach(button => {
		        button.addEventListener("click", () => {
		        	classButtons.forEach(btn => btn.classList.remove("selected"));
		            button.classList.add("selected");
		        });
		    });
		});
	</script>
	<script> // 탑승 인원
	    document.addEventListener("DOMContentLoaded", function () {
	        const counters = document.querySelectorAll(".counter");
	
	        counters.forEach(counter => {
	            const minus = counter.querySelector("button:first-child");
	            const plus = counter.querySelector("button:last-child");
	            const value = counter.querySelector("span");
	
	            minus.addEventListener("click", () => {
	                let current = parseInt(value.textContent);
	                if (current > 0) {
	                    value.textContent = current - 1;
	                }
	            });
	
	            plus.addEventListener("click", () => {
	                let current = parseInt(value.textContent);
	                value.textContent = current + 1;
	            });
	        });
	    });
	</script>
	<script> // 출발/귀국일 선택
		let currentTripType = 'round';
		let datepickerInstance;
		
		//기존 인스턴스 제거
		function initFlatpickr(type) {
			if (datepickerInstance) {
				datepickerInstance.destroy();
			}
			// 기본 옵션
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
				    			document.getElementById("returnDate").value = "";
				    		}
				    	}
				    }
			};
			
			if (type === "round") {
				datepickerInstance = flatpickr("#departureDate", {
					...baseOptions,
					mode: "range",
					plugins: [new rangePlugin({input: "#returnDate"})],
				});
			} else if (type === "oneway") {
				datepickerInstance = flatpickr("#departureDate", {
					...baseOptions,
					mode: "single"
				});
			}
		}
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
		
		function toggleReturnDate(type) {
			const returnInput = document.getElementById("returnDate");
			
			if (type === "round") {
				returnInput.style.display = "inline-block";
			} else {
				returnInput.style.display = "none";
				returnInput.value = "";
			}
		}
		// 초기 설정
		window.onload = () => {
			toggleReturnDate(currentTripType);
			initFlatpickr(currentTripType);
		}
	</script>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="utf-8" />
		<link rel="stylesheet" href="<c:url value='/css/global.css' />" />
		<link rel="stylesheet" href="<c:url value='/css/reservation.css'/>"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<title>航空券検索</title>
	</head>
	<body>
		<%@ include file = "header.jsp" %>
	    <div class = "container">
	        <h2>旅程/日付選択</h2>
	        <div class = "trip-type" id = tripType>
	            <button class = "trip-option selected" data-type = "round" onclick = "selectTripType('round')">往復</button>
	            <button class = "trip-option" data-type = "oneway" onclick = "selectTripType('oneway')">片道</button>
	            <button class = "trip-option" data-type = "multiway" onclick = "selectTripType('multiway')">多区間</button>
	        </div>
	        
	        <div class = "airport-selection">
	        	<select id = "departireAirport" class = "airport-select">
	        		<option class = "airport-option" value = "INC">ICN 仁川</option>
	        		<option class = "airport-option" value = "OKA">OKA 沖縄</option>
	        	</select>
	        	
	        	<select id = "arrivalAirport" class = "airport-select">
	        		<option class = "airport-option" value = "OKA">OKA 沖縄</option>
	        		<option class = "airport-option" value = "INC">ICN 仁川</option>
	        	</select>
	        	<input type="text" id="departureDate" class="date-input" placeholder="出発日を選択" readonly>
	        	<input type="text" id="returnDate" class="date-input" placeholder="帰りの日を選択" readonly>
	        </div>
	
	        <h3>搭乗人員選択</h3>
	        <div class = "passengers">
	            <div class = "passenger-type">
	                <label>大人（12歳以上）</label>
	                <div class = "counter">
	                    <button>-</button>
	                    <span>0</span>
	                    <button>+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>小児（2歳〜12歳未満）</label>
	                <div class = "counter">
	                    <button>-</button>
	                    <span>0</span>
	                    <button>+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>幼児（2歳未満）</label>
	                <div class = "counter">
	                    <button>-</button>
	                    <span>0</span>
	                    <button>+</button>
	                </div>
	            </div>
	        </div>
	
	        <h3>座席クラス選択</h3>
	        <div class = "class-type">
	            <button class = "class-option" data-type = "eco-spec">エコノミー特価</button>
	            <button class = "class-option" data-type = "eco-norm">エコノミー一般</button>
	            <button class = "class-option" data-type = "buis">ビジネス</button>
	            <button class = "class-option" data-type = "first">ファースト</button>
	        </div>
	
	        <div class = "confirm-button">
	            <button onclick = "location.href='confirm'">航空券検索</button>
	        </div>
	    </div>
	</body>
</html>

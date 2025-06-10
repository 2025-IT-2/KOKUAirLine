<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<script>
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
	<script>
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
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			flatpickr("#departureDate", {
			    dateFormat: "Y.m.d",
			    minDate: "today"
			});
			
			flatpickr("#returnDate", {
			    dateFormat: "Y.m.d",
			    minDate: "today"
			});
		});
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
	        <div class = "trip-type">
	            <button class = "trip-option" data-type = "round">往復</button>
	            <button class = "trip-option" data-type = "oneway">片道</button>
	            <button class = "trip-option" data-type = "multiway">多区間</button>
	        </div>
	        
	        <div class = "airport-selection">
	        	<select id = "departireAirport" class = "airport-select">
	        		<option value = "INC">ICN 仁川</option>
	        		<option value = "OKA">OKA 沖縄</option>
	        	</select>
	        	
	        	<select id = "arrivalAirport" class = "airport-select">
	        		<option value = "OKA">OKA 沖縄</option>
	        		<option value = "INC">ICN 仁川</option>
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

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
	
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
		<form method = "get" action = "reservationCheckPrice">
	    <div class = "container">
	    	<div class = "reservation-container">
	        <h2>旅程/日付選択</h2>
			<!-- 여행 종류 선택 -->
	        <div class = "trip-type" id = tripType>
	            <button type="button" class = "trip-option selected" data-type = "round">
	            <rb>往復</rb><rt>おうふく</rt></ruby>
	            </button>
	            <button type="button" class = "trip-option" data-type = "oneway">
	            <rb>片道</rb><rt>かたみち</rt></ruby>
	            </button>
	            <button type="button" class = "trip-option" data-type = "multiway">
	            <rb>多区間</rb><rt>たくかん</rt></ruby>
	            </button>
	        </div>
	        <input type = "hidden" name = "tripType" id = "tripTypeInput" value = "round">
			<!-- 공항 선택 -->
			<div class = "airport-selection">
				<select name="departureAirport" id = "departureAirport" class = "airport-select">
				    <c:forEach var="list" items="${dataList}">
	       				<c:if test="${list.flightDepCode == 'NRT'}">
	       					<option>${list.airportName} / ${list.flightDepCode}</option>
	       				</c:if>
				    </c:forEach>
				</select>
				<select name="arrivalAirport" id = "arrivalAirport" class = "airport-select">		    
				    <c:forEach var="list" items="${dataList}">
					    <c:if test="${list.flightDepCode == 'MNL'}">
					        <option selected>${list.airportName} / ${list.flightDepCode}</option>
					    </c:if>
					</c:forEach>
				</select>
	        	<input type="text" id="departureDate" name = "departureDate" class="date-input" 
	        	placeholder="出発日を選択">
	        	<input type="text" id="arrivalDate" name = "arrivalDate" class="date-input"
	        	placeholder="帰りの日を選択">
			</div>
			<!-- 탑승객 선택 -->
	        <h3>
	        <ruby class="taxfree-t"><rb>搭乗人員選択</rb><rt>とうじょうじんいんせんたく</rt></ruby>
	        </h3>
	        <div class = "passengers">
	            <div class = "passenger-type">
	                <label>
	                <ruby class="taxfree-t"><rb>大人</rb><rt>おとな</rt></ruby>
	                （12<ruby class="taxfree-t"><rb>歳以上</rb><rt>さいいじょう</rt></ruby>）
	                </label>
	                <div class = "counter">
	                    <button type = "button">-</button>
	                    <span>0</span>
	                    <button type = "button">+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>
	                <ruby class="taxfree-t"><rb>小児</rb><rt>しょうに</rt></ruby>
	                （2<ruby class="taxfree-t"><rb>歳</rb><rt>さい</rt></ruby>
	                〜12<ruby class="taxfree-t"><rb>歳未満</rb><rt>さいみまん</rt></ruby>）
	                </label>
	                <div class = "counter">
	                    <button type = "button">-</button>
	                    <span>0</span>
	                    <button type = "button">+</button>
	                </div>
	            </div>
	            <div class = "passenger-type">
	                <label>
	                <ruby class="taxfree-t"><rb>幼児</rb><rt>ようじ</rt></ruby>
	                （2<ruby class="taxfree-t"><rb>歳未満</rb><rt>さいみまん</rt></ruby>）
	                </label>
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
	        <h3>
	        <ruby class="taxfree-t"><rb>座席</rb><rt>ざせき</rt></ruby>クラス
	        <ruby class="taxfree-t"><rb>選択</rb><rt>せんたく</rt></ruby>
	        </h3>
	        <div class = "class-type">
	            <button type="button" class = "class-option" data-type = "eco-spec">エコノミー
	            <ruby class="taxfree-t"><rb>特価</rb><rt>とっか</rt></ruby>
	            </button>
	            <button type="button" class = "class-option" data-type = "eco-norm">エコノミー
	            <ruby class="taxfree-t"><rb>一般</rb><rt>いっぱん</rt></ruby>
	            </button>
	            <button type="button" class = "class-option" data-type = "buis">ビジネス</button>
	            <button type="button" class = "class-option" data-type = "first">ファースト</button>
	        </div>
	        <input type = "hidden" name = "classType" id = "classTypeInput" value = "">
	        <div class = "confirm-button">
	            <button type = "submit">
	            <ruby class="taxfree-t"><rb>航空券検索</rb><rt>こうくうけんけんさく</rt></ruby>
	            </button>
	        </div>
	    </div>
	    </div>
		</form>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/rangePlugin.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
		<script src="/js/reservation.js"></script>
		<%@ include file="footer.jsp" %>
	</body>
</html>

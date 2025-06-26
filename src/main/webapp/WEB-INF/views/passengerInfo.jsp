<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="<c:url value='/css/global.css' />" />
	<link rel="stylesheet" href="<c:url value='/css/passengerInfo.css'/>"/>

	<title>搭乗者情報入力</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>  
		<form action="/submitPassengerInfo" method="post">     
			<div class="screen">
				<!-- 제목 -->        
				<h2 class="title"><ruby><rb>搭乗者情報</rb><rt>とうじょうしゃじょうほう</rt></ruby></h2>
				
				<!-- 숨겨진 input: 인원수 전달용 -->
				<input type="hidden" name="adultCount" value="${adultCount}">
				<input type="hidden" name="childCount" value="${childCount}">
				<input type="hidden" name="infantCount" value="${infantCount}">
				<input type="hidden" name="departureAirport" value="${param.departureAirport}" />
				<input type="hidden" name="arrivalAirport" value="${param.arrivalAirport}" />
				<input type="hidden" name="tripType" value="${param.tripType}" />
				<input type="hidden" name="departureDate" value="${param.departureDate}" />
				<input type="hidden" name="arrivalDate" value="${param.arrivalDate}" />
				<input type="hidden" name="classType" value="${param.classType}" />
				<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}" /> 
				<input type="hidden" name="selectedFlightNo" value="${param.selectedFlightNo}" />
				<input type="hidden" name="arrivalFlightNo" value="${param.arrivalFlightNo}" />
				<input type="hidden" name="flightMealYN" value="Y" />
				<input type="hidden" name="depAirFare" id="depAirFare" value="${param.depAirFare}" />
				<input type="hidden" name="arrAirFare" id="arrAirFare" value="${param.arrAirFare}" />    

				
				<div class="overlap-wrapper">
					<div class="overlap">
						<!-- 대인 입력 -->
						<c:forEach var="i" begin="1" end="${adultCount}">
							<jsp:include page="passengerInfoForm.jsp">
							<jsp:param name="index" value="${i}" />
							<jsp:param name="type" value="大人" />
							</jsp:include>
						</c:forEach>

						<!-- 소아 입력 -->
						<c:forEach var="i" begin="1" end="${childCount}">
							<jsp:include page="passengerInfoForm.jsp">
							<jsp:param name="index" value="${i}" />
							<jsp:param name="type" value="小児" />
							</jsp:include>
						</c:forEach>

						<!-- 유아 입력 -->
						<c:forEach var="i" begin="1" end="${infantCount}">
							<jsp:include page="passengerInfoForm.jsp">
							<jsp:param name="index" value="${i}" />
							<jsp:param name="type" value="幼児" />
							</jsp:include>
						</c:forEach>

						<!-- 최하단 부모 컨테이너 -->
						<div class="container">
							<!-- 예약자 연락처 -->        
							<div class="Reservation-PhoneNumber"><ruby><rb>予約者</rb><rt>よやくしゃ</rt></ruby><ruby><rb>連絡先</rb><rt>れんらくさき</rt></ruby></div>
							<div class="PhoneNumber">
								<input
								type="tel"
								id="phone"
								name="phone"
								value="${phone}"
								placeholder="090-1234-5678"
								pattern="[0-9\-]{10,13}"
								required
								autocomplete="tel">
							</div>
							
							<!-- 금액 표시창 -->
							<div class="box">
								<div class="element">
									<c:choose>
									<c:when test="${not empty totalPrice and totalPrice > 0}">
										<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" /> 円
									</c:when>
									<c:otherwise>
										0 円
									</c:otherwise>
									</c:choose>
								</div>
							</div>

							<!-- 결정 버튼 -->
							<div id="finishbtn">
							  <button type="button" onclick="openWindow()" class="text-wrapper-15" id="finishBtn">
							    <ruby><rb>予約完了</rb><rt>よやくかんりょう</rt></ruby>
							  </button>             
							</div>
						</div>
					</div>
				</div>          
			</div>
		</form>

		<script>
			document.addEventListener("DOMContentLoaded", function () {
				const form = document.querySelector("form");
				const today = new Date();
			
				// ✅ 운임 값: URL 쿼리 스트링에서 받아와 hidden input 설정
				const urlParams = new URLSearchParams(window.location.search);
				const depAirFare = Math.floor(parseFloat(urlParams.get("depAirFare") || "0"));
				const arrAirFare = Math.floor(parseFloat(urlParams.get("arrAirFare") || "0"));
				const totalPrice = depAirFare + arrAirFare;
			
				const depAirFareInput = document.getElementById("depAirFare");
				const arrAirFareInput = document.getElementById("arrAirFare");
				const totalPriceInput = document.getElementById("totalPrice");
			
				if (depAirFareInput) depAirFareInput.value = depAirFare;
				if (arrAirFareInput) arrAirFareInput.value = arrAirFare;
				if (totalPriceInput) totalPriceInput.value = totalPrice;
			
				console.log("📦 passengerInfo.jsp loaded fares:");
				console.log("depAirFare =", depAirFare);
				console.log("arrAirFare =", arrAirFare);
				console.log("totalPrice =", totalPrice);
			
				// ✅ 날짜 관련 제한 설정
				const maxBirthDate = new Date(today);
				maxBirthDate.setDate(today.getDate() - 1);

				const minAdultBirth = new Date(today);
				minAdultBirth.setFullYear(today.getFullYear() - 13);

				const minChildBirth = new Date(today);
				minChildBirth.setFullYear(today.getFullYear() - 13);

				const maxChildBirth = new Date(today);
				maxChildBirth.setFullYear(today.getFullYear() - 2);

				const maxInfantBirth = new Date(today);
				maxInfantBirth.setFullYear(today.getFullYear() - 2);

				function stripTime(date) {
					return new Date(date.getFullYear(), date.getMonth(), date.getDate());
				}

				const minExpiry = stripTime(new Date(today));
				minExpiry.setMonth(minExpiry.getMonth() + 3);

				const maxExpiry = stripTime(new Date(today));
				maxExpiry.setFullYear(maxExpiry.getFullYear() + 10);

				const minExpiryStr = minExpiry.toISOString().split("T")[0];
				const maxExpiryStr = maxExpiry.toISOString().split("T")[0];
				const maxBirthStr = maxBirthDate.toISOString().split("T")[0];
			
				// ✅ 날짜 및 input 필드 제한 적용
				document.querySelectorAll("input[type='date'][id*='passportExpiry']").forEach(input => {
					input.min = minExpiryStr;
					input.max = maxExpiryStr;
					if (!input.value) input.value = minExpiryStr;
				});

				document.querySelectorAll("input[type='date'][id*='birthdate']").forEach(input => {
					input.max = maxBirthStr;
				});
			
				// ✅ 여권번호 필터링
				document.querySelectorAll("input[id*='passportNumber']").forEach(input => {
					input.addEventListener("input", () => {
						input.value = input.value.toUpperCase().replace(/[^A-Z0-9]/g, "").slice(0, 9);
					});
				});
			
				// ✅ 영문 이름 필터링
				document.querySelectorAll("input[id*='engFirstName'], input[id*='engLastName']").forEach(input => {
					input.addEventListener("input", () => {
						input.value = input.value.toUpperCase().replace(/[^A-Z]/g, "");
					});
				});
			
				// ✅ 유효성 검사
				form.addEventListener("submit", function (e) {
					const inputs = form.querySelectorAll("input, select");
					for (const input of inputs) {
						const inputName = input.getAttribute("name");
						if (!inputName) continue;

						const value = input.value.trim();

						if (!/^(大人|小児|幼児)_(\w+)(\d+)$/.test(inputName)) {
							continue;
						}

						// 디버깅 로그
						console.log("🕵️‍♀️ 검사 중인 필드:", input);
						console.log("🔎 name =", inputName);
						console.log("✏️ value =", value);
						console.log("📛 name: " + inputName + ", value: " + value);

						// 💡 라벨 변환
						let label = inputName;
						const match = inputName.match(/^(大人|小児|幼児)_(\w+)(\d+)$/);
						if (match) {
							const type = match[1]; // 대인/소아/유아
							const field = match[2]; // engFirstName 등
							const index = match[3]; // 1, 2 등

							const typeMap = {
								"大人": "大人",
								"小児": "小児",
								"幼児": "幼児"
							};

							const fieldMap = {
								engFirstName: "名前",
								engLastName: "苗字",
								birthdate: "生年月日",
								gender: "性別",
								passportNumber: "パスポート番号",
								passportExpiry: "パスポート有効期限",
								nationality: "国籍",
								passportCountry: "発行国"
							};

							const typeLabel = typeMap[type] || type;
							const fieldLabel = fieldMap[field] || field;
							label = typeLabel + index + "の" + fieldLabel;
						}

						// 공백 검사
						if (!value) {
							alert(label + " は必須項目です。");
							input.focus();
							e.preventDefault();
							return false;
						}

						// 영어 이름 검사
						if (inputName.includes("engFirstName") || inputName.includes("engLastName")) {
							if (!/^[A-Z]+$/.test(value)) {
								alert(label + " は英大文字のみ入力可能です。");
								input.focus();
								e.preventDefault();
								return false;
							}
						}

						// 생년월일 검사
						if (inputName.includes("birthdate")) {
							const birthDate = new Date(value);
							if (birthDate > maxBirthDate) {
								alert(label + " は本日以前の日付を入力してください。");
								input.focus();
								e.preventDefault();
								return false;
							}

							if (inputName.startsWith("大人") && birthDate > minAdultBirth) {
								alert(label + " は満13歳以上のみ搭乗可能です。");
								input.focus();
								e.preventDefault();
								return false;
							}

							if (inputName.startsWith("小児") && (birthDate < minChildBirth || birthDate > maxChildBirth)) {
								alert(label + " は満2歳以上13歳未満のみです。");
								input.focus();
								e.preventDefault();
								return false;
							}

							if (inputName.startsWith("幼児") && birthDate < maxInfantBirth) {
								alert(label + " は満2歳未満のみです。");
								input.focus();
								e.preventDefault();
								return false;
							}
						}

						// 여권번호 검사
						if (inputName.includes("passportNumber")) {
							if (!/^[A-Z0-9]{9}$/.test(value)) {
								alert(label + " は英大文字と数字で9桁入力してください。");
								input.focus();
								e.preventDefault();
								return false;
							}
						}

						// 셀렉트박스 검사
						if (inputName.includes("nationality") || inputName.includes("passportCountry")) {
							if (value === "") {
								alert(label + " を選択してください。");
								input.focus();
								e.preventDefault();
								return false;
							}
						}	
					}
				});
			});
		</script>
	</body>      
</html>
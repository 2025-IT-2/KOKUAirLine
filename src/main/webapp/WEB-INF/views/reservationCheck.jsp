<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>予約確認</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />"/>
  <link rel="stylesheet" href="<c:url value='/css/reservationCheck.css'/>" />
</head>
<body>
<%@ include file="header.jsp" %>

<div class="screen">
  <div class="dual-panel">

    <!-- 왼쪽: 예약 목록 -->
    <div class="left-panel">
      <h2 class="title">予約確認</h2>
      <div class="notice">
        <h4>注意事項 :</h4>
        <p>※ 航空券の払い戻しは不可の場合があります。<br> 搭乗時間の2時間前までにチェックインしてください。</p>
		<!--한국어 원문 : 항공권은 환불 불가일 수 있으며, 탑승 시간 2시간 전까지 체크인 바랍니다.-->
      </div>
      <div class="view-wrapper">
      	<div class="view">
		  <c:choose>
		    <c:when test="${empty resList}">
		      <p style="text-align: center; font-size: 1.2em; color: gray; margin-top: 50px;">
		        予約履歴がありません。
		      </p>
		    </c:when>
		    <c:otherwise>
		      <c:forEach var="reservation" items="${resList}" varStatus="status">
	            <div class="reservation-info">
	              <p><strong>${reservation.reservationHolder.userFirstName}</strong> 様の予約番後は 
	                <strong>${reservation.resiNum}</strong> です。</p>
	              <div class="flight-info">
	                <div class="location">
	                  <div class="airport">${reservation.flightInfo.departure}</div>
	                  <div class="arrow">→</div>
	                  <div class="airport">${reservation.flightInfo.arrival}</div>
	                </div>
	                <div class="details">
	                  <div>航空会社: 空港団</div>
	                  <div>機内食: ${reservation.flightMealYN}</div>
	                  <div>座席クラス: ${reservation.classType}</div>
	                  <div>出発日: ${reservation.flightInfo.departureDate} / 到着日: ${reservation.flightInfo.arrivalDate}</div>
	                </div>
	              </div>
	            </div>
	            <div class="summary">
	              <div>総人数: ${reservation.resNumL + reservation.resNumM + reservation.resNumS}人</div>
	              <div>合計金額: ${reservation.payment.totalFare}ウォン</div>
	              <div>要約状態: ${reservation.cancelStep}</div>
	            </div>
	            <form onsubmit="return showBoardingPass('${reservation.resiNum}')">
	              <button type="submit">ボーディング・パス確認</button>
	            </form>
            	<hr style="margin: 30px 0;" />
          	</c:forEach>
          	</c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>

    <!-- 오른쪽: 탑승권 표시 iframe -->
    <div class="right-panel">
      <iframe id="boardingFrame" src="" width="100%" height="100%" style="border:none; margin-bottom: 20px;"></iframe>
    </div>
  </div>
</div>

<script>
  function showBoardingPass(reservationNumber) {
    const frame = document.getElementById("boardingFrame");
    frame.src = "<c:url value='/boardingPassInfo'/>?reservationNumber=" + encodeURIComponent(reservationNumber);
    return false; // 폼 전송 방지
  }
</script>

</body>
</html>

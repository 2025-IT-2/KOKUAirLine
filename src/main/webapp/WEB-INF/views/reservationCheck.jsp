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
      <h2 class="title"><ruby><rb>予約確認</rb><rt>よやくかくにん</rt></ruby></h2>
      <div class="notice">
        <h4><ruby><rb>注意事項</rb><rt>ちゅういじこう</rt></ruby> :</h4>
        <p>※ <ruby><rb>航空券</rb><rt>こうくうけん</rt></ruby>の<ruby><rb>払</rb><rt>はら</rt></ruby>い<ruby><rb>戻</rb><rt>もど</rt></ruby>しは<ruby><rb>不可</rb><rt>ふか</rt></ruby>の<ruby><rb>場合</rb><rt>ばあい</rt></ruby>があります。
			<br> <ruby><rb>搭乗時間</rb><rt>とうじょうじかん</rt></ruby>の2<ruby><rb>時間前</rb><rt>じかんまえ</rt></ruby>までにチェックインしてください。</p>
		<!--한국어 원문 : 항공권은 환불 불가일 수 있으며, 탑승 시간 2시간 전까지 체크인 바랍니다.-->
      </div>
      <div class="view-wrapper">
      	<div class="view">
		  <c:choose>
		    <c:when test="${empty resList}">
		      <p style="text-align: center; font-size: 1.2em; color: gray; margin-top: 50px;">
		        <div><ruby><rb>予約履歴</rb><rt>よやくりれき</rt></ruby>がありません。
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
	                  <div><ruby><rb>航空会社</rb><rt>こうくうがいしゃ</rt></ruby>: 空港団</div>
	                  <div><ruby><rb>機内食</rb><rt>きないしょく</rt></ruby>: ${reservation.flightMealYN}</div>
	                  <div><ruby><rb>座席</rb><rt>ざせき</rt></ruby>クラス: ${reservation.classType}</div>
	                  <div><ruby><rb>出発日</rb><rt>しゅっぱつび</rt></ruby>: ${reservation.flightInfo.departureDate}
						<br> <ruby><rb>到着日</rb><rt>とうちゃくび</rt></ruby>: ${reservation.flightInfo.arrivalDate}</div>
	                </div>
	              </div>
	            </div>
	            <div class="summary">
	              <div><ruby><rb>総人数</rb><rt>そうにんず</rt></ruby>: ${reservation.resNumL + reservation.resNumM + reservation.resNumS}人</div>
	              <div><ruby><rb>総額</rb><rt>そうがく</rt></ruby>: ${resPayMap[reservation.resiNum].totalFare}ウォン</div>
	              <div><ruby><rb>予約状態</rb><rt>よやくじょうたい</rt></ruby>: ${reservation.cancelStep}</div>
	            </div>
	            <form onsubmit="return showBoardingPass('${reservation.resiNum}')">
	              <button id="toboarding" type="submit">ボーディング・パス<ruby><rb>確認</rb><rt>かくにん</rt></ruby></button>
	            </form>
            	<hr style="margin: 30px 0;" />
          	</c:forEach>
          	</c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>

    <!-- 오른쪽: 탑승권 표시 iframe //해당 부분 팝업으로 분리	-->
    <div class="right-panel">
      <iframe id="boardingFrame" src="" width="100%" height="100%" style="border:none; margin-bottom: 20px;"></iframe>
    </div>

  </div>
</div>

<script>
	/*function openWindow () { //보딩패스 팝업용
	  const options = 'width=600, height=800, top=400, left=100, resizable=no, scrollbars=no'
	  window.open('/boardingPassInfo','boardingPassInfo',options)
	}*/
 /* function showBoardingPass(reservationNumber) {
    const frame = document.getElementById("boardingFrame");
    frame.src = "<c:url value='/boardingPassInfo'/>?reservationNumber=" + encodeURIComponent(reservationNumber);
    return false; // 폼 전송 방지
  }*/
</script>
<script>
  function showBoardingPass(reservationNumber) {
    document.getElementById("boardingFrame").src = "<c:url value='/boardingPassInfo'/>?reservationNumber=" + encodeURIComponent(reservationNumber);
    return false;
  }
</script>

</body>
</html>

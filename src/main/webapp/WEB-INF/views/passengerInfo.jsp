<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <form action="/submitpassengerInfo" method="post">     
      <div class="screen">
        <!-- 제목 -->        
        <h2 class="title">搭乗者情報</h2>
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
              <div class="Reservation-PhoneNumber">予約者<br />連絡先</div>
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
                    <c:when test="${not empty amount}">
                      ${amount} 円
                    </c:when>
                    <c:otherwise>
                      金額が見つかりません。
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>

              <!-- 결정 버튼 -->
              <button type="submit" class="text-wrapper-15" onclick="location.href='/home'">決定</button>                
            </div>
          </div>
        </div>          
      </div>
    </form>
  </body>
</html>
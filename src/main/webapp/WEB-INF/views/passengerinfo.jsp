<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/passengerinfo.css'/>"/>
    <title>搭乗者情報入力</title>
  </head>
  <body>
    <%@ include file="header.jsp" %>  

    <div class="screen">
      <div class="overlap-wrapper">
        <div class="view"></div>
        <div class="overlap">
            
          <!-- 제목 -->        
          <div class="text-wrapper-2">搭乗者情報</div>

          <form action="/submitPassengerInfo" method="post">
            <!-- 탑승자 정보 영역 -->
            <c:forEach var="i" begin="1" end="${adultCount}">     
              <div class="group">
                <div class="overlap-group">
                  <div class="view-2"> 
                    <div class="overlap-2">
                      <div class="rectangle-2"></div>

                      <!-- 성인 구분 -->
                      <div class="text-wrapper-10">成人${i}</div>

                  <div class="screen">
                    <!-- 성별 입력 -->
                    <div class="group-2">
                      <!-- 라벨 박스 -->
                      <div class="div-wrapper">
                        <div class="text-wrapper-3">性別</div>
                      </div>

                      <!-- 선택 영역 -->
                      <div class="div-2">
                      <!-- 남성 선택 -->
                        <label class="radio-label" style="left: 60px;">
                          <input type="radio" name="gender${i}" value="male" class="radio-input" checked> 男
                        </label>

                      <!-- 여성 선택 -->
                        <label class="radio-label" style="left: 200px;">
                          <input type="radio" name="gender${i}" value="female" class="radio-input"> 女
                        </label>
                      </div>
                    </div>
                  </div>

                      <!-- 이름 입력 -->
                      <div class="group-3">
                        <div class="div-wrapper"><div class="text-wrapper-6">名前</div></div>
                        <div class="div-2">
                          <div class="text-wrapper-7">名
                            <input type="text" id="firstName${i}" name="firstName${i}" placeholder="お名を入力してください">
                          </div>
                          <div class="text-wrapper-8">姓
                            <input type="text" id="lastName${i}" name="lastName${i}" placeholder="お姓を入力してください">
                          </div>
                        </div>
                      </div>

                      <!-- 생년월일 입력 -->
                      <div class="group-4">
                        <div class="div-wrapper"><div class="text-wrapper-9">生年月日</div></div>
                        <div class="div-2">
                          <input type="date" id="birthdate${i}" name="birthdate${i}" value="1990-01-01" />
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </c:forEach>

            <!-- 예약자 연락처 텍스트 -->
            <div class="Reservation-PhoneNumber">予約者<br />連絡先</div>
            
            <!-- 전화번호 입력창 -->
            <div class="PhoneNumber">
              <input
              type="tel"
              id="phone"
              name="phone"
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
          </form>
          
        </div>
      </div>
    </div>
  </body>
</html>
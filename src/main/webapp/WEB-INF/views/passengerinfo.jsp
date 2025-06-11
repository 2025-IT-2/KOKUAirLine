<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
   <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/passengerinfo.css'/>"/>
    <title>搭乗者情報入力</title>
  </head>
  <body>
  <%@ include file="header.jsp" %>  
    <div class="screen">
      <div class="overlap-wrapper">
        <div class="overlap">
          <div class="view"></div>
          
          <div class="text-wrapper-2">搭乗者情報</div>
          <div class="group">
            <div class="overlap-group">
              <div class="view-2"> 
                <div class="overlap-2">
                  <div class="rectangle-2"></div>

              <div class="screen">
                <div class="group-2">
                  <!-- 라벨 박스 -->
                  <div class="div-wrapper">
                    <div class="text-wrapper-3">性別</div>
                  </div>

                  <!-- 선택 영역 -->
                  <div class="div-2">
                  <!-- 남성 선택 -->
                    <label class="radio-label" style="left: 60px;">
                      <input type="radio" name="gender" value="male" class="radio-input" checked> 男
                    </label>

                  <!-- 여성 선택 -->
                    <label class="radio-label" style="left: 200px;">
                      <input type="radio" name="gender" value="female" class="radio-input"> 女
                    </label>
                  </div>
                </div>
              </div>

                  <div class="group-3">
                    <div class="div-wrapper"><div class="text-wrapper-6">名前</div></div>
                    <div class="div-2">
                      <div class="text-wrapper-7">名</div>
                      <div class="text-wrapper-8">姓</div>
                    </div>
                  </div>

                  <div class="group-4">
                    <div class="div-wrapper"><div class="text-wrapper-9">生年月日</div></div>
                    <div class="div-2"></div>
                  </div>
                </div>

                <div class="text-wrapper-10">成人1</div>
                <div class="text-wrapper-11">成人2</div>
              </div>

              <div class="rectangle-3"></div>
              <div class="rectangle-4"></div>
              <div class="rectangle-5"></div>
              <div class="rectangle-6"></div>
              <div class="text-wrapper-12">1980.08.08</div>
            </div>
          </div>

          <div class="text-wrapper-13">予約者<br />連絡先</div>
          <div class="text-wrapper-14">위에 표 반복...</div>
          <div class="rectangle-7"></div>
          <div class="text-wrapper-15">決定</div>
          <div class="rectangle-8"></div>
          <div class="rectangle-9"></div>
          <div class="text-wrapper-16">010-5555-6666</div>
          <div class="element">50,000&nbsp;&nbsp; 円</div>

        </div>
      </div>
    </div>
  </body>
</html>
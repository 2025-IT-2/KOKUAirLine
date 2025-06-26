<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 탑승객 정보 입력 그룹 -->
<div class="info-group">

  <!-- 클래스명 영문 변환 -->
  <c:choose>
    <c:when test="${param.type == '大人'}">
      <c:set var="cardType" value="Adult" />
    </c:when>
    <c:when test="${param.type == '小児'}">
      <c:set var="cardType" value="Child" />
    </c:when>
    <c:otherwise>
      <c:set var="cardType" value="Infant" />
    </c:otherwise>
  </c:choose>

  <div class="card ${cardType}">
    <!-- 대인 / 소아 / 유아 구분 -->
    <div class="adult">
      ${param.type}${param.index}
    </div>

    <div class="card2-group">
    <!-- 성명 입력 -->
    <div class="card2">
      <div class="card-title"><ruby><rb>名前</rb><rt>なまえ</rt></ruby></div>
      <div class="name">
        <label>
          <ruby><rb>名前</rb><rt>なまえ</rt></ruby>
          <input 
            type="text" 
            class="uppercase"
            id="${param.type}_engFirstName${param.index}" 
            name="${param.type}_engFirstName${param.index}" 
            placeholder="例：HIROKO"
          >
        </label>
        
        <label>
          <ruby><rb>苗字</rb><rt>みょうじ</rt></ruby>
          <input 
            type="text"
            class="uppercase"
            id="${param.type}_engLastName${param.index}" 
            name="${param.type}_engLastName${param.index}" 
            placeholder="例：SATO"
          >
        </label>

      </div>
    </div>

    <!-- 생년월일 입력 -->
    <div class="card2">
      <div class="card-title"><ruby><rb>生年月日</rb><rt>せいねんがっぴ</rt></ruby></div>
      <div class="birth">
        <input 
          type="text" 
          id="${param.type}_birthdate${param.index}" 
          name="${param.type}_birthdate${param.index}" 
          placeholder="生年月日を選択してください"
        >
      </div>
    </div>

    <!-- 성별 입력 -->
    <div class="card2">
      <div class="card-title"><ruby><rb>性別</rb><rt>せいべつ</rt></ruby></div>
      <div class="gender">
        <label class="radio-label">
          <input 
            type="radio" 
            name="${param.type}_gender${param.index}" 
            value="male" 
            class="radio-input" 
            checked
          > 男
        </label>

        <label class="radio-label">
          <input 
            type="radio" 
            name="${param.type}_gender${param.index}" 
            value="female" 
            class="radio-input"
          > 女
        </label>
      </div>
    </div>

    <!-- 여권 정보 입력 -->
    <div class="card2">
      <div class="card-title">パスポート<ruby><rb>情報</rb><rt>じょうほう</rt></ruby></div>
      
      <div class="passport">
        <label>
          パスポート<ruby><rb>番号</rb><rt>ばんごう</rt></ruby>
          <input 
            type="text"
            class="passport"
            maxlength="9" 
            id="${param.type}_passportNumber${param.index}" 
            name="${param.type}_passportNumber${param.index}" 
            placeholder="パスポート番号（最大9桁）"
          >
        </label>

        <label>
          <ruby><rb>有効期間</rb><rt>ゆうこうきかん</rt></ruby>
          <input 
            type="text" 
            id="${param.type}_passportExpiry${param.index}" 
            name="${param.type}_passportExpiry${param.index}"
            placeholder="日付を選択してください"
          >
        </label>

        <label>
          <ruby><rb>国籍</rb><rt>こくせき</rt></ruby>
          <select 
            id="${param.type}_nationality${param.index}" 
            name="${param.type}_nationality${param.index}">
            <option value="">国籍を選択してください</option>
            <c:forEach var="entry" items="${countryMap}">
              <option value="${entry.key}">${entry.value}</option>
            </c:forEach>
          </select>
        </label>

        <label>
          <ruby><rb>発行局</rb><rt>はっこうきょく</rt></ruby>
          <select 
            id="${param.type}_passportCountry${param.index}" 
            name="${param.type}_passportCountry${param.index}">
            <option value="">発行国を選択してください</option>
            <c:forEach var="entry" items="${countryMap}">
              <option value="${entry.key}">${entry.value}</option>
            </c:forEach>
          </select>
        </label>
      </div>
    </div>
    </div>
    
  </div>
</div>

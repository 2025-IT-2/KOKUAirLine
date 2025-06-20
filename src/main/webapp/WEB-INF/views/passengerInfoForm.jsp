<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 탑승객 정보 입력 그룹 -->
<div class="info-group">
  <div class="card">
    <!-- 대인 / 소아 / 유아 구분 -->
    <div class="adult">
      ${param.type}${param.index}
    </div>

    <div class="card2-group">
    <!-- 성명 입력 -->
    <div class="card2">
      <div class="card-title">名前</div>
      <div class="name">
        <label>
          名
          <input 
            type="text" 
            id="${param.type}_engFirstName${param.index}" 
            name="${param.type}_engFirstName${param.index}" 
            placeholder="お名を入力してください。 ex.Hiroko"
          >
        </label>
        
        <label>
          姓
          <input 
            type="text" 
            id="${param.type}_engLastName${param.index}" 
            name="${param.type}_engLastName${param.index}" 
            placeholder="お姓を入力してください。 ex.Sato"
          >
        </label>

      </div>
    </div>

    <!-- 생년월일 입력 -->
    <div class="card2">
      <div class="card-title">生年月日</div>
      <div class="birth">
        <input 
          type="date" 
          id="${param.type}_birthdate${param.index}" 
          name="${param.type}_birthdate${param.index}" 
          value="1990-01-01"
        >
      </div>
    </div>

    <!-- 성별 입력 -->
    <div class="card2">
      <div class="card-title">性別</div>
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
      <div class="card-title">パスポート情報</div>
      
      <div class="passport">
        <label>
          パスポート番号
          <input 
            type="text" 
            id="${param.type}_passportNumber${param.index}" 
            name="${param.type}_passportNumber${param.index}" 
            placeholder="パスポート番号を入力してください"
          >
        </label>

        <label>
          有効期限
          <input 
            type="date" 
            id="${param.type}_passportExpiry${param.index}" 
            name="${param.type}_passportExpiry${param.index}"
            value="1990-01-01"
          >
        </label>

        <label>
          国籍
          <input 
            type="text" 
            id="${param.type}_nationality${param.index}" 
            name="${param.type}_nationality${param.index}" 
            placeholder="国籍を入力してください"
          >
        </label>

        <label>
          発行国
          <input 
            type="text" 
            id="${param.type}_passportCountry${param.index}" 
            name="${param.type}_passportCountry${param.index}" 
            placeholder="発行国を入力してください"
          >
        </label>
      </div>
    </div>
    </div>
    
  </div>
</div>

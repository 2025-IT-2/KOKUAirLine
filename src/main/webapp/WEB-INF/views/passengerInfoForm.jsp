<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="overlap-wrapper">
  <div class="view"></div>
  <div class="overlap">
    <div class="group">
      <div class="overlap-group">
        <div class="overlap-2">
          <div class="rectangle-2"></div>

          <!-- 대인 / 소아 / 유아 구분 -->
          <div class="adult">${param.type}${param.index}</div>

          <!-- 성별 입력 -->
          <div class="group-2">
            <div class="div-wrapper">
              <div class="text-wrapper-3">性別</div>
            </div>
            <div class="div-2">
              <label class="radio-label" style="left: 60px;">
                <input type="radio" name="${param.type}_gender${param.index}" value="male" class="radio-input" checked> 男
              </label>

              <label class="radio-label" style="left: 200px;">
                <input type="radio" name="${param.type}_gender${param.index}" value="female" class="radio-input"> 女
              </label>
            </div>
          </div>

          <!-- 성명 입력 -->
          <div class="group-3">
            <div class="div-wrapper"><div class="text-wrapper-6">名前</div></div>
            <div class="div-2">
              <div class="text-wrapper-7">名
                <input type="text" id="${param.type}_firstName${param.index}" name="${param.type}_firstName${param.index}" placeholder="お名を入力してください">
              </div>
              <div class="text-wrapper-8">姓
                <input type="text" id="${param.type}_lastName${param.index}" name="${param.type}_lastName${param.index}" placeholder="お姓を入力してください">
              </div>
            </div>
          </div>

          <!-- 생년월일 입력 -->
          <div class="group-4">
            <div class="div-wrapper"><div class="text-wrapper-9">生年月日</div></div>
            <div class="div-2">
              <input type="date" id="${param.type}_birthdate${param.index}" name="${param.type}_birthdate${param.index}" value="1990-01-01" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div> 
</div>
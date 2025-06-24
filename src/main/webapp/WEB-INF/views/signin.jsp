<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>会員登録</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/signin.css'/>">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/i18n/datepicker-ja.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<!-- 생략된 head는 동일 -->

<body>
  <%@ include file="header.jsp" %>
  <%@ page import="java.util.*" %>

  <div class="form-container">
  <form:form modelAttribute="userInfo" method="post" action="/signin">

    <label for="input-id">ID</label>
    <form:input path="userId" type="text" id="input-id" name="ID" placeholder="重複検査を行います"/>
    <form:errors path="userId" cssClass="error-message" />

    <label for="input-pw">PW</label>
    <form:input path="password" type="password" id="input-pw" name="pw" placeholder="最小８文字、最大１６文字"/>
    <form:errors path="password" cssClass="error-message" />

    <label for="input-mail">メール</label>
    <form:input path="email" type="text" id="input-mail" name="EMAIL" placeholder="重複検査を行います"/>
    <form:errors path="email" cssClass="error-message" />

    <label for="firstname">名前</label>
    <form:input path="userFirstName" type="text" id="firstname" name="firstname" placeholder="英語で入力してください"/>
    <form:errors path="userFirstName" cssClass="error-message" />

    <label for="lastname">性</label>
    <form:input path="userLastName" type="text" id="lastname" name="lastname" placeholder="英語で入力してください"/>
    <form:errors path="userLastName" cssClass="error-message" />

    <label>性別</label>
    <div>
      <form:radiobutton path="gender" value="true" /> 男性
      <form:radiobutton path="gender" value="false" /> 女性
    </div>
    <form:errors path="gender" cssClass="error-message" />

    <label for="input-phone">電話番号</label>
    <form:input path="userPhone" type="text" id="input-phone" name="phone" placeholder="例: 01012345678"/>
    <form:errors path="userPhone" cssClass="error-message" />

    <label for="input-nation">国籍</label>
    <form:select path="national" id="input-nation">
      <option value="">選択してください</option>
      <c:forEach var="entry" items="${countryMap}">
        <option value="${entry.key}">${entry.value}</option>
      </c:forEach>
    </form:select>
    <form:errors path="national" cssClass="error-message" />

    <label for="caldateField">生年月日</label>
    <div>
      <p class="birthinfo">会員登録は１２歳以上可能</p>
    </div>
    <div>
      <form:input path="birthDate" type="text" id="caldateField" name="birthdate" readonly=""/>
      <form:errors path="birthDate" cssClass="error-message" />
    </div>


      <!-- 약관 동의 자리 -->
      <div class="terms-section">
        <label>利用規約</label>
        <div class="terms-box" id="terms-content-1">読み込み中...</div>
        <label><input type="checkbox" name="terms1" id="terms1" class="terms-checkbox"> 利用規約に同意します</label>

        <label>キャンセルポリシー</label>
        <div class="terms-box" id="terms-content-2">読み込み中...</div>
        <label><input type="checkbox" name="terms2" id="terms2" class="terms-checkbox"> キャンセルポリシーに同意します</label>

        <label>特定商取引法に基づく表記</label>
        <div class="terms-box" id="terms-content-3">読み込み中...</div>
        <label><input type="checkbox" name="terms3" id="terms3" class="terms-checkbox"> 同意します</label>

        <label>Cookieポリシー</label>
        <div class="terms-box" id="terms-content-4">読み込み中...</div>
        <label><input type="checkbox" name="terms4" id="terms4" class="terms-checkbox"> 同意します</label>

        <label>安全なご利用のために</label>
        <div class="terms-box" id="terms-content-5">読み込み中...</div>
        <label><input type="checkbox" name="terms5" id="terms5" class="terms-checkbox"> 同意します</label>

        <label>プライバシーポリシー</label>
        <div class="terms-box" id="terms-content-6">読み込み中...</div>
        <label><input type="checkbox" name="terms6" id="terms6" class="terms-checkbox"> 同意します</label>
      </div>

      <div id="signinbutton">
        <button type="submit" class="signin">会員登録</button>
      </div>

    </form:form>
  </div>

  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

  <script>
    function loadSectionFromHTML(filePath, sectionId, targetElementId) {
      $.get(filePath, function(data) {
        const $html = $("<div>").html(data);
        const $section = $html.find("#" + sectionId);
        if ($section.length > 0) {
          $("#" + targetElementId).html($section.html());
        } else {
          $("#" + targetElementId).html("読み込み失敗");
        }
      });
    }

    $(function () {
      const termsFile = "/html/termsofservice.html";
      loadSectionFromHTML(termsFile, "terms-of-service", "terms-content-1");
      loadSectionFromHTML(termsFile, "cancel-policy", "terms-content-2");
      loadSectionFromHTML(termsFile, "torihiki-policy", "terms-content-3");
      loadSectionFromHTML(termsFile, "cookie-policy", "terms-content-4");
      loadSectionFromHTML(termsFile, "safety-policy", "terms-content-5");
      loadSectionFromHTML(termsFile, "privacy-policy", "terms-content-6");
    });
  </script>
</body>
</html>


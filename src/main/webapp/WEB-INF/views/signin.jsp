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
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<!-- 생략된 head는 동일 -->

<body>
  <%@ include file="header.jsp" %>
  <%@ page import="java.util.*" %>
  
  <c:if test="${not empty error}">
    <input type="hidden" id="SigninErrorMessage" value="${error}" />
  </c:if>
  
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

    <label for="firstname"><ruby><rb>名前</rb><rt>なまえ</rt></ruby></label>
    <form:input path="userFirstName" type="text" id="firstname" name="firstname" placeholder="英語で入力してください"/>
    <form:errors path="userFirstName" cssClass="error-message" />

    <label for="lastname"><ruby><rb>姓</rb><rt>せい</rt></ruby></label>
    <form:input path="userLastName" type="text" id="lastname" name="lastname" placeholder="英語で入力してください"/>
    <form:errors path="userLastName" cssClass="error-message" />

    <label><ruby><rb>性別</rb><rt>せいべつ</rt></ruby></label>
    <div>
      <form:radiobutton path="gender" value="true" /> <ruby><rb>男性</rb><rt>だんせい</rt></ruby>
      <form:radiobutton path="gender" value="false" /> <ruby><rb>女性</rb><rt>じょせい</rt></ruby>
    </div>
    <form:errors path="gender" cssClass="error-message" />

    <label for="input-phone"><ruby><rb>電話番号</rb><rt>でんわばんご</rt></ruby></label>
    <form:input path="userPhone" type="text" id="input-phone" name="phone" placeholder="例: 01012345678"/>
    <form:errors path="userPhone" cssClass="error-message" />

    <label for="input-nation"><ruby><rb>国籍</rb><rt>こくせき</rt></ruby></label>
    <form:select path="national" id="input-nation">
      <option value=""><ruby><rb>選択</rb><rt>せんたく</rt></ruby>してください</option>
      <c:forEach var="entry" items="${countryMap}">
        <option value="${entry.key}">${entry.value}</option>
      </c:forEach>
    </form:select>
    <form:errors path="national" cssClass="error-message" />

    <label for="caldateField">
	  <ruby><rb>生年月日</rb><rt>せいねんがっぴ</rt></ruby>
		</label>
		<div>
		  <p class="birthinfo">
		    <ruby><rb>会員登録</rb><rt>かいいんとうろく</rt></ruby>は１２
		    <ruby><rb>歳</rb><rt>さい</rt></ruby>
		    <ruby><rb>以上</rb><rt>いじょう</rt></ruby>
		    <ruby><rb>可能</rb><rt>かのう</rt></ruby>
		  </p>
		</div>
		<div>
		  <form:input path="birthDate" id="caldateField" readonly="true" />
		  <form:errors path="birthDate" cssClass="error-message" />
		</div>

      <!-- 약관 동의 자리 -->
      <!-- 전체 동의 영역 -->
<div class="terms-section">

  <!-- 전체 동의 체크박스 -->
  <label>
    <input type="checkbox" id="agreeAll" class="terms-checkbox">
    全ての約款に同意します（すべてチェック）
  </label>

  <!-- 전체 접기/펼치기 버튼 -->
  <button type="button" id="toggleTermsView">すべての約款を表示</button>
  
  	<!-- 약관 전체 영역 (초기에는 접힘) -->
	  <div id="allTermsContent" style="display: none; margin-top: 10px;">
	
	    <!-- 반복되는 약관 내용들 -->
	    <label><ruby><rb>利用規約</rb><rt>りようきやく</rt></ruby></label>
	    <div class="terms-box" id="terms-content-1">読み込み中...</div>
	    <input type="checkbox" name="terms1" id="terms1" class="terms-checkbox"> 
	    <ruby><rb>利用規約</rb><rt>りようきやく</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	    <label>キャンセルポリシー</label>
	    <div class="terms-box" id="terms-content-2">読み込み中...</div>
	    <input type="checkbox" name="terms2" id="terms2" class="terms-checkbox"> キャンセルポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	    <label><ruby><rb>特定商取引法</rb><rt>とくていしょうとりひきほう</rt></ruby>に<ruby><rb>基</rb><rt>もと</rt></ruby>づく<ruby><rb>表記</rb><rt>ひょうき</rt></ruby></label>
	    <div class="terms-box" id="terms-content-3">読み込み中...</div>
	    <input type="checkbox" name="terms3" id="terms3" class="terms-checkbox"> 
	    <ruby><rb>特定商取引法</rb><rt>とくていしょうとりひきほう</rt></ruby>に<ruby><rb>基</rb><rt>もと</rt></ruby>づく<ruby><rb>表記</rb><rt>ひょうき</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	    <label>Cookieポリシー</label>
	    <div class="terms-box" id="terms-content-4">読み込み中...</div>
	    <input type="checkbox" name="terms4" id="terms4" class="terms-checkbox"> Cookieポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	    <label><ruby><rb>安全</rb><rt>あんぜん</rt></ruby>なご<ruby><rb>利用</rb><rt>りよう</rt></ruby>のために</label>
	    <div class="terms-box" id="terms-content-5">読み込み中...</div>
	    <input type="checkbox" name="terms5" id="terms5" class="terms-checkbox"> <ruby><rb>安全</rb><rt>あんぜん</rt></ruby>なご<ruby><rb>利用</rb><rt>りよう</rt></ruby>の<ruby><rb>規約</rb><rt>きやく</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	    <label>プライバシーポリシー</label>
	    <div class="terms-box" id="terms-content-6">読み込み中...</div>
	    <input type="checkbox" name="terms6" id="terms6" class="terms-checkbox"> プライバシーポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
	
	  </div>
  </div>

      <div id="signinbutton">
        <button type="submit" class="signin"><span><ruby><rb>会員登録</rb><rt>かいいんとうろく</rt></ruby></span></button>
      </div>

    </form:form>
  </div>
	<%@ include file="footer.jsp" %>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
  <script src="/js/datepicker-ja.js"></script>
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
  <script>
	  $(function () {
	    $("#caldateField").datepicker({
	      dateFormat: "yy-mm-dd", // LocalDate와 호환
	      changeYear: true,
	      changeMonth: true,
	      yearRange: "1900:2025",
	      maxDate: "-12Y", // 12세 이상만 선택 가능
	      defaultDate: "-20Y",
	      showAnim: "fadeIn"
	    });
	
	    // 일본어 로케일 적용 (이미 i18n/datepicker-ja.min.js를 불러왔으므로)
	    $.datepicker.setDefaults($.datepicker.regional["ja"]);
	  });
	</script>
 	<script src="/js/signin.js"></script>
</body>
	
</html>


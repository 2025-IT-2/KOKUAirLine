<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
  <!--헤더 불러오기-->
  <%@ include file="header.jsp" %>
  <!--국가코드 불러오는 용-->
  <%@ page import="java.util.*" %>

  <form action="/signin" method="post" id="signin" class="form-container">
    <label for="input-id">ID</label>
    <input type="text" id="input-id" name="ID" placeholder="重複検査を行います">

    <label for="input-pw">PW</label>
    <input type="password" id="input-pw" name="pw" placeholder="最小８文字、最大１６文字">

    <label for="input-mail">メール</label>
    <input type="text" id="input-mail" name="EMAIL" placeholder="重複検査を行います">

    <label for="firstname"><ruby><rb>名前</rb><rt>なまえ</rt></ruby></label>
    <input type="text" id="firstname" name="firstname" placeholder="英語で入力してください">

    <label for="lastname"><ruby><rb>苗字</rb><rt>みょうじ</rt></ruby></label>
    <input type="text" id="lastname" name="lastname" placeholder="英語で入力してください">

    <label><ruby><rb>性別</rb><rt>せいべつ</rt></ruby></label>
    <div>
      <input type="radio" name="gender" value="male"> <ruby><rb>男性</rb><rt>だんせい</rt></ruby>
      <input type="radio" name="gender" value="female"> <ruby><rb>女性</rb><rt>じょせい</rt></ruby>
    </div>

    <label for="input-phone"><ruby><rb>電話番号</rb><rt>でんわばんご</rt></ruby></label>
    <input type="text" id="input-phone" name="phone" placeholder="例: 01012345678">

	
    <label for="input-nation"><ruby><rb>国籍</rb><rt>こくせき</rt></ruby></label>
	<%
	  String[] countryCodes = Locale.getISOCountries();
	  Arrays.sort(countryCodes); // 알파벳순(일본어 기준이기 때문에 가나순 정렬) 정렬
	%>
	<select id="input-nation" name="nationality">
	  <option value=""><ruby><rb>選択</rb><rt>せんたく</rt></ruby>してください</option>
	<%
	  for (String code : countryCodes) {
	    Locale locale = new Locale("", code);
	    String name = locale.getDisplayCountry(Locale.JAPANESE);
	%>
	    <option value="<%= code %>"><%= name %></option>
	<%
	  }
	%>
	</select>
	
    <label for="caldateField"><ruby><rb>生年月日</rb><rt>せいねんがっぴ</rt></ruby></label>
	<div>
		<p class="birthinfo"><ruby><rb>会員登録</rb><rt>かいいんとうろく</rt></ruby>は１２<ruby><rb>歳</rb><rt>さい</rt></ruby><ruby><rb>以上</rb><rt>いじょう</rt></ruby><ruby><rb>可能</rb><rt>かのう</rt></ruby></p>
		</div>
	<div>
	      <input type="text" id="caldateField" name="birthdate" readonly>
	    </div>
	

		<!-- 약관 동의 섹션 -->
		<div class="terms-section">
		  <label><ruby><rb>利用規約</rb><rt>りようきやく</rt></ruby></label>
			  <div class="terms-box" id="terms-content-1">読み込み中...</div>
		  <label>
		    <input type="checkbox" name="terms1" id="terms1" class="terms-checkbox"> <ruby><rb>利用規約</rb><rt>りようきやく</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>

		  <label>キャンセルポリシー</label>
		  <div class="terms-box" id="terms-content-2">読み込み中...</div>
		  <label>
		    <input type="checkbox" name="terms2" id="terms2" class="terms-checkbox"> キャンセルポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>

		  <label><ruby><rb>特定商取引法</rb><rt>とくていしょうとりひきほう</rt></ruby>に<ruby><rb>基</rb><rt>もと</rt></ruby>づく<ruby><rb>表記</rb><rt>ひょうき</rt></ruby></label>
		  <div class="terms-box" id="terms-content-3">読み込み中...</div>
		  <label>
		    <input type="checkbox" name="terms3" id="terms3" class="terms-checkbox"> <ruby><rb>特定商取引法</rb><rt>とくていしょうとりひきほう</rt></ruby>に<ruby><rb>基</rb><rt>もと</rt></ruby>づく<ruby><rb>表記</rb><rt>ひょうき</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>

		  <label>Cookieポリシー</label>
		  <div class="terms-box" id="terms-content-4">読み込み中...</div>
		  <label>
		    <input type="checkbox" name="terms4" id="terms4" class="terms-checkbox"> Cookieポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>

		  <label><ruby><rb>安全</rb><rt>あんぜん</rt></ruby>なご<ruby><rb>利用</rb><rt>りよう</rt></ruby>のために</label>
		  <div class="terms-box" id="terms-content-5">読み込み中...</div>
		  <label id=nowhite>
		    <input type="checkbox" name="terms5" id="terms5" class="terms-checkbox"> <ruby><rb>安全</rb><rt>あんぜん</rt></ruby>なご<ruby><rb>利用</rb><rt>りよう</rt></ruby>の<ruby><rb>規約</rb><rt>きやく</rt></ruby>に<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>
		  
		  <label>プライバシーポリシー</label>
		  <div class="terms-box" id="terms-content-6">読み込み中...</div>
		  <label>
		    <input type="checkbox" name="terms6" id="terms6" class="terms-checkbox"> プライバシーポリシーに<ruby><rb>同意</rb><rt>どうい</rt></ruby>します
		  </label>
	  </div>
	  	



	<div id="signinbutton">	
    <button type="submit" class="signin"><span><ruby><rb>会員登録</rb><rt>かいいんとうろく</rt></ruby></span></button>
	</div>
	
  </form>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	

	<!--내용 검사 스크립트 + alert-->
	<script>
			//입력한 내용 검사
		  document.getElementById('signin').addEventListener('submit', function (e) {
		    const id = document.getElementById('input-id').value.trim();
		    const pw = document.getElementById('input-pw').value.trim();
		    const email = document.getElementById('input-mail').value.trim();
		    const firstname = document.getElementById('firstname').value.trim();
		    const lastname = document.getElementById('lastname').value.trim();

		    // 이메일 형식 확인용 정규식
		    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		    // 기본 검사 조건
		    if (id === '' || pw === '' || email === '' || firstname === '' || lastname === '') {
		      alert('全部入力してください。');
		      e.preventDefault();
		      return;
		    }

		    if (pw.length < 8 || pw.length > 16) {
		      alert('パスワードは最小８文字以上、最大１６文字以上で入力してください。');
		      e.preventDefault();
		      return;
		    }

		    if (!emailRegex.test(email)) {
		      alert('正しいメールを入力してください。');
		      e.preventDefault();
		      return;
		    }
		  });
		  
		  // 이용약관 동의 확인 추가
		  if (!document.getElementById('terms1').checked) {
		    alert('「利用規約」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  // 취소 정책 동의 확인 추가
		  if (!document.getElementById('terms2').checked) {
		    alert('「キャンセルポリシー」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  // 전자 상거래 정책 동의 확인 추가
		  if (!document.getElementById('terms2').checked) {
		    alert('「特定商取引法に基づく表記」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  // Cookie 확인 추가
		  if (!document.getElementById('terms4').checked) {
		    alert('「Cookieポリシー」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  // 안전이용약관에 동의해주세요
		  if (!document.getElementById('terms5').checked) {
		    alert('「安全なご利用のために」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  // 개인정보이용동의에 동의해주세요
		  if (!document.getElementById('terms5').checked) {
		    alert('「プライバシーポリシー」に同意してください。');
		    e.preventDefault();
		    return;
		  }
		  
		</script>
	
		

	
	

		<script>
	
	  $(function() {
	    $.datepicker.setDefaults($.datepicker.regional['ja']);

	    // 오늘 날짜 기준으로 만 12세 생일 = 오늘 - 12년
	    const today = new Date();
	    const maxYear = today.getFullYear() - 12;
	    const maxMonth = today.getMonth();
	    const maxDay = today.getDate();

	    const maxDateObj = new Date(maxYear, maxMonth, maxDay);

	    $("#caldateField").datepicker({
	      dateFormat: "yy-mm-dd",
	      changeYear: true,
		  changeMonth:true,
	      yearRange: "1900:" + maxYear,
	      maxDate: maxDateObj,
	      showAnim: "fadeIn",
	      showButtonPanel: true,
	      closeText: "閉じる",
	      currentText: "今日",
	      monthNamesShort: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
	      dayNamesMin: ["日","月","火","水","木","金","土"],
	      firstDay: 0,
	      beforeShow: function(input, inst) {
	        setTimeout(function() {
	          inst.dpDiv.css({
	            'font-size': '1rem',
	            'border-radius': '12px',
	            'box-shadow': '0 10px 20px rgba(0,0,0,0.2)'
	          });
	        }, 0);
	      }
	    });
	  });
  
	  
	</script>
	

	<!--이용 약관 출력 및 불러오기 스크립트-->
	<script>
		const checkbox = document.getElementById('myCheckbox');
		const elementToHide = document.getElementById('elementToHide');
		
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
	

	
	<!--국가 리스트 불러오기 스크립트 / 현재 작동 안함ㅠ 끝까지 미사용시 삭제 예정-->
	<script>
	  fetch('https://restcountries.com/v3.1/all')
	    .then(response => response.json())
	    .then(data => {
	      const select = document.getElementById('input-nation');

	      // 국가 이름을 일본어 기준으로 정렬 (없으면 영어 fallback)
	      const sorted = data.sort((a, b) => {
	        const nameA = a.translations?.jpn?.common || a.name.common;
	        const nameB = b.translations?.jpn?.common || b.name.common;
	        return nameA.localeCompare(nameB, 'ja');
	      });

	      // 옵션 추가
	      sorted.forEach(country => {
	        const option = document.createElement('option');
	        option.value = country.cca2; // ISO 3166-1 alpha-2 코드
	        option.textContent = country.translations?.jpn?.common || country.name.common;
	        select.appendChild(option);
	      });

	      // 기타 국가 추가
	      const etc = document.createElement('option');
	      etc.value = 'ETC';
	      etc.textContent = '他の国';
	      select.appendChild(etc);
	    })
	    .catch(error => {
	      console.error("国のリストを取得できませんでした:", error);
	    });
	</script>

</body>
</html>

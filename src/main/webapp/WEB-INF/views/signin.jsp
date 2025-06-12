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
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
  <%@ include file="header.jsp" %>

  <form action="/signin" method="post" id="signin" class="form-container">
    <label for="input-id">ID</label>
    <input type="text" id="input-id" name="ID" placeholder="重複検査を行います">

    <label for="input-pw">PW</label>
    <input type="password" id="input-pw" name="pw" placeholder="最小８文字、最大１６文字">

    <label for="input-mail">メール</label>
    <input type="text" id="input-mail" name="EMAIL" placeholder="重複検査を行います">

    <label for="firstname">名前</label>
    <input type="text" id="firstname" name="firstname" placeholder="英語で入力してください">

    <label for="lastname">性</label>
    <input type="text" id="lastname" name="lastname" placeholder="英語で入力してください">

    <label>性別</label>
    <div>
      <input type="radio" name="gender" value="male"> 男性
      <input type="radio" name="gender" value="female"> 女性
    </div>

    <label for="input-phone">電話番号</label>
    <input type="text" id="input-phone" name="phone" placeholder="例: 01012345678">

    <label for="input-nation">国籍</label>
    <select id="input-nation" name="nationality">
      <option value="">選択してください</option>
      <option value="KR">韓国</option>
      <option value="JP">日本</option>
      <option value="US">アメリカ</option>
      <option value="CN">中国</option>
      <option value="VN">ベトナム</option>
      <option value="DE">ドイツ</option>
      <option value="CA">カナダ</option>
      <option value="AU">オーストラリア</option>
      <option value="AT">オーストリア</option>
      <option value="ETC">他の国</option>
    </select>

    <label for="caldateField">生年月日</label>
    <div>
      <input type="text" id="caldateField" name="birthdate" readonly>
      <button type="button" id="calendarBtn">📅</button>
    </div>

    <button type="submit" class="signin">会員登録</button>
  </form>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	
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
		</script>
	
	<script>
		//캘린더 스크립트
	  $(function() {
	    // 캘린더 버튼 클릭 시 달력 표시
	    $("#calendarBtn").click(function() {
	      $("#caldateField").datepicker("show");
	    });

	    // 날짜 선택 시 해당 input에 값 설정
	    $("#caldateField").datepicker({
	      dateFormat: "yy-mm-dd"  // 원하는 포맷
	    });
	  });
	</script>
</body>
</html>

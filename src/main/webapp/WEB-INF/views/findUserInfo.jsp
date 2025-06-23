<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8" />
  <title>ID・PASSWORDを探す</title>
  <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
  <link rel="stylesheet" href="<c:url value='/css/findUserInfo.css'/>">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script>
      // Ctrl + 휠 확대/축소 방지
      window.addEventListener('wheel', function(e) {
          if (e.ctrlKey) {
              e.preventDefault();
          }
      }, { passive: false });

      // Ctrl + +/- 확대/축소 방지
      window.addEventListener('keydown', function(e) {
          if (e.ctrlKey && (e.key === '+' || e.key === '-' || e.key === '=')) {
              e.preventDefault();
          }
      });
  </script>
</head>
<body>
	<div class="popup-container">
	        <h2>ID / PASSWORDを探す</h2>
	        <form method="post" action="/findUserInfo">
	            <label for="lastname">性</label>
	            <input type="text" name="lastname" id="lastname" required>

	            <label for="firstname">名前</label>
	            <input type="text" name="firstname" id="firstname" required>

	            <label for="phone">電話番号</label>
	            <input type="text" name="phone" id="phone" required>

	            <button type="submit">探す</button>
	        </form>

	        <c:if test="${not empty userId}">
	            <div class="result">
	                <p><strong>아이디:</strong> ${userId}</p>
	                <p><strong>비밀번호:</strong> ${password}</p>
	            </div>
	        </c:if>

	        <c:if test="${not empty error}">
	            <div class="result">
	                <p>${error}</p>
	            </div>
	        </c:if>
	    </div>

</body>
</html>

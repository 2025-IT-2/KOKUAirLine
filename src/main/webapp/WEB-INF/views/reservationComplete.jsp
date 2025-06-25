<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>予約完了</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      text-align: center;
    }
    h2 {
      color: #2a7ae2;
    }
    p {
      margin-top: 20px;
      font-size: 1.1em;
    }
    button {
      margin-top: 30px;
      padding: 10px 20px;
      font-size: 1em;
      cursor: pointer;
    }
  </style>
  
</head>
<body>

  <h2>ご予約が完了しました！</h2>
  <p>ご利用いただきありがとうございます。予約確認メールをお送りしました。</p>
  <button onclick="closePopup()">閉じる</button>
  <script>
  <script>
  function closePopup() {
    if (window.opener && !window.opener.closed) {
      window.opener.location.href = "/home";  // 🔥 부모창 이동
    }
    window.close(); // 🔥 팝업창 닫기
  }
  </script>
  <script src="<c:url value='/js/reservationComplete.js' />"></script>
</body>
</html>

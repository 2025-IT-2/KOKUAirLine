<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 상세</title>
</head>
<body>

<h2>${notice.title}</h2>
<p><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
<p>${notice.content}</p>

<form action="/reservationStart">
  <button type="submit">예약하기</button>
</form>

</body>
</html>
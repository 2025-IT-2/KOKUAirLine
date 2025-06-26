<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
</head>
<body>

<h2>${notice.title}</h2>

<c:if test="${not empty notice.regDate}">
  <p><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
</c:if>

<p>${notice.content}</p>

<form action="/reservationStart">
  <button type="submit">예약하기</button>
</form>

</body>
</html>

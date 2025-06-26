<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>나리타 마닐라 항공편 안내</title>
  <link rel="stylesheet" href="<c:url value='/css/notice.css' />" />
</head>
<body>
<%@ include file="header.jsp" %>

<h2>${notice.title}</h2>
<p><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
<p>${notice.content}</p>

<form action="/reservation" method="get">
  <button type="submit" class="notice-button">予約する</button>
</form>

</body>
</html>
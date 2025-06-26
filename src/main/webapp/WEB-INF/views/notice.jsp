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
<table class="flight-table">
  <thead>
    <tr>
      <th>노선</th>
      <th>편명</th>
      <th>운항 요일</th>
      <th>출발</th>
      <th>도착</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ナリタ→マニラ</td>
      <td>KOKU123</td>
      <td>毎日</td>
      <td>03:30</td>
      <td>07:15</td>
    </tr>
    <tr>
      <td>マニラ→ナリタ</td>
      <td>KOKU456</td>
      <td>毎日</td>
      <td>13:30</td>
      <td>17:15</td>
    </tr>
    <tr>
      <td colspan="5">${notice.content}</td>
    </tr>
  </tbody>
</table>

<form action="/reservation" method="get">
  <button type="submit" class="notice-button">予約する</button>
</form>

</body>
</html>
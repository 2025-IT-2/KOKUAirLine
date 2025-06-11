<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" /> <!-- url 변환을 해주는 jstl 하이퍼링크 기능 -->
    <link rel="stylesheet" href="<c:url value='/css/home.css' />" />
  </head>
  <body>
  <%@ include file="header.jsp" %>
    <div class="screen">
		<div class="chatgpt-image-wrapper">
	         <img src="<c:url value='/img/homepageImage.png' />" alt="Main Visual" />
       </div>
     </div>
  </body>
</html>

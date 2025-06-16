<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/home.css' />" />
  </head>
  <body>
    <%@ include file="header.jsp" %>

    <!-- 이미지 영역 -->
    <div class="chatgpt-image-wrapper">
      <img src="<c:url value='/img/homepageImage.png' />" alt="Main Visual" />
    </div>

    <!-- 상품 리스트 영역 -->
    <div class="product-container">
      <c:forEach var="product" items="${productList}">
        <div class="product-card">
          <img src="<c:url value='${product.image}' />" alt="상품 이미지" />
          <div class="product-info">
            <h3>${product.name}</h3>
            <p>${product.description}</p>
          </div>
        </div>
      </c:forEach>
    </div>
  </body>
</html>

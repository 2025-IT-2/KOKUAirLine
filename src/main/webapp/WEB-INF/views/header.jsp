<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <div class="header">
	    <div class="logo">空港団</div>
	    <div class="nav">
	        <a href="#">予約</a>
	        <a href="#">オンライン・チェックイン</a>
	        <a href="#">予約確認</a>
	    </div>
	    <c:choose>
		    <c:when test="${not empty sessionScope.loginUserId}">
		      <!-- 로그인된 경우 -->
		      <div class="user-info">
		        ${sessionScope.loginUserId}님
		        <a href="<c:url value='/logout' />">로그아웃</a>
		      </div>
		    </c:when>
		    <c:otherwise>
		      <!-- 로그인되지 않은 경우 -->
		      <button class="login-button" onclick="location.href='<c:url value="/login" />'">ログイン</button>
		    </c:otherwise>
		  </c:choose>
	</div>

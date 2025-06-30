<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <div class="header">
    <!-- 로고를 누르면 홈으로 이동 -->
	<button class="homebtn" onclick="location.href='<c:url value='/home' />'"><span>航空団</span></button>    
	<!--<a href="<c:url value='/home' />">空港団</a>-->
	    <!-- 각 상단 버튼을 누르면 해당 화면으로 이동 -->
<!--
		    <div class="nav">
	        <a href="<c:url value='/reservation' />">予約</a>
	        <a href="<c:url value='/onlinecheckin' />">オンライン・チェックイン</a>
	        <a href="<c:url value='/reservationCheck' />">予約確認</a>
	    </div>
		-->
	    <div class="nav">
	    <!-- 각 상단 버튼을 누르면 해당 화면으로 이동 -->
		<button class="menubtn" onclick="location.href='<c:url value='/reservation' />'"><span><ruby><rb>予約</rb><rt>よやく</rt></ruby></span></button>
<!--		<button class="menubtn" onclick="location.href='<c:url value='/onlinecheckin' />'"><span>オンライン・チェックイン</span></button>
		<button class="menubtn" onclick="location.href='<c:url value='/reservationCheck' />'"><span><ruby><rb>予約確認</rb><rt>よやくかくにん</rt></ruby></span></button>
-->		<button class="menubtn" onclick="location.href='<c:url value='/onlinecheckin' />'"><span><ruby><rb>予約確認</rb><rt>よやくかくにん</rt></ruby></span></button>

	    </div>
	    <c:choose>
		    <c:when test="${not empty sessionScope.loginUserId}">
		      <!-- 로그인된 경우 -->
		      <div class="user-info">
		        ${sessionScope.loginUserId}<ruby><rb>様</rb><rt>さま</rt></ruby>
		      <button class="login-button" onclick="location.href='<c:url value='/logout' />'">ログアウト</button>
		       <!-- <a href="<c:url value='/logout' />">ログアウト</a>-->
		      </div>
		    </c:when>
		    <c:otherwise>
		      <!-- 로그인되지 않은 경우 -->
		      <button class="login-button" onclick="location.href='<c:url value="/login" />'">ログイン</button>
		    </c:otherwise>
		  </c:choose>
	</div>

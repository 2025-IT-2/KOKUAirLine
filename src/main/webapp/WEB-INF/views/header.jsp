<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>"/>
</head>
<body>
    <div class="header">
    <div class="logo">空港団</div>
    <div class="nav">
        <a href="#">予約</a>
        <a href="#">オンライン・チェックイン</a>
        <a href="#">予約確認</a>
    </div>
    <div class="login">
        <button onclick="location.href='login.jsp'">ログイン</button>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>인원 선택</title>
    <link rel="stylesheet" type="text/css" href="resources/css/adultSelectTesto.css">
</head>
<body>
<div class="container">
    <h1>탑승 인원 선택</h1>
    <form action="passengerInfo" method="get">
        <div class="select-group">
            <label for="adultCount">대인:</label>
            <select name="adultCount" id="adultCount">
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
            </select>
        </div>

        <div class="select-group">
            <label for="childCount">소아:</label>
            <select name="childCount" id="childCount">
                <option value="0">0명</option>
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
            </select>
        </div>

        <div class="select-group">
            <label for="infantCount">유아:</label>
            <select name="infantCount" id="infantCount">
                <option value="0">0명</option>
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
            </select>
        </div>

        <br>
        <button type="submit">다음</button>
    </form>
</div>
</body>
</html>
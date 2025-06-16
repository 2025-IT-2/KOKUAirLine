<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>항공편 검색 결과</title>
</head>
<body>
    <h1>검색 결과</h1>

    <c:choose>
        <c:when test="${not empty flights}">
            <table border="1">
                <thead>
                    <tr>
                        <th>항공사</th>
                        <th>공항</th>
                        <th>편명</th>
                        <th>예정시간</th>
                        <th>예상시간</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="flight" items="${flights}">
                        <tr>
                            <td>${flight.airlineKorean}</td>
                            <td>${flight.airport}</td>
                            <td>${flight.flightId}</td>
                            <td>${flight.scheduleDateTime}</td>
                            <td>${flight.estimatedDateTime}</td>
                            <td>
                                <form action="/confirm" method="post">
                                    <input type="hidden" name="flightId" value="${flight.flightId}" />
                                    <button type="submit">선택</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>검색된 항공편이 없습니다.</p>
        </c:otherwise>
    </c:choose>

    <a href="/reservation">← 돌아가기</a>
</body>
</html>
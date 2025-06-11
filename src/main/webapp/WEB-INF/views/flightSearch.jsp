<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/reservationCheckPrice" method="post">
    <input type="hidden" name="departure" value="ソウル / 仁川" />
    <input type="hidden" name="arrival" value="도쿄" />
    <input type="hidden" name="tripType" value="왕복" />
    <input type="hidden" name="travelDate" value="06.09. 화요일" />
    <input type="hidden" name="passengerCount" value="2" />
    <button type="submit">가격 확인</button>
</form>
</body>
</html>
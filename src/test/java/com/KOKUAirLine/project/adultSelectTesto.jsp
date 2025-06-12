<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>人数選択</title>
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/adultSelectTesto.css'/>"/>
  </head>
  <body>
    <div class="container">
      <h1>搭乗者人数選択</h1>
      
      <form action="passengerinfo" method="get">
        <label for="adultCount">成人の人数を選択してください:</label>
        <select id="adultCount" name="adultCount" required>
          <option value="1">1人</option>
          <option value="2">2人</option>
          <option value="3">3人</option>
          <option value="4">4人</option>
        </select>
        <button type="submit">次へ</button>
      </form>
    </div>
  </body>
</html>
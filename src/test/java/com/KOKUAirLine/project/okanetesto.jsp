<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="<c:url value='/css/global.css' />" />
    <link rel="stylesheet" href="<c:url value='/css/okanetesto.css'/>"/>
    <title>お金テスト</title>
  </head>
  <body>
  
    <form action="/passengerinfo" method="GET">
      <input
        type="text"
        id="amount"
        name="amount"
        placeholder="例: 10,000"
        inputmode="numeric"
        required
        oninput="formatCurrency(this)">
      <button type="submit">送信</button>
    </form>

    <script>
      function formatCurrency(input) {
        const value = input.value.replace(/[^\d]/g, '');
        const formatted = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        input.value = formatted;
      }
    </script>
  </body>
</html>
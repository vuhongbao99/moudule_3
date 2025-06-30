<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Kết quả Calculator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 2rem;
    }
    .result-box {
      max-width: 400px;
      padding: 1rem;
      border: 1px solid #ccc;
      border-radius: 8px;
      background-color: #f9f9f9;
    }
    .result-box h3 {
      margin-top: 0;
    }
    .error {
      color: red;
      font-weight: bold;
    }
    .back-link {
      margin-top: 1rem;
      display: inline-block;
    }
  </style>
</head>
<body>
<div class="result-box">
  <h3>Kết quả Calculator</h3>

  <c:choose>
    <c:when test="${not empty errorMessage}">
      <p class="error">Lỗi: ${errorMessage}</p>
    </c:when>
    <c:otherwise>
      <p>
        <strong>${operand1}</strong>
          ${operator}
        <strong>${operand2}</strong>
        =
        <strong>${result}</strong>
      </p>
    </c:otherwise>
  </c:choose>

  <a class="back-link" href="index.jsp">← Quay lại</a>
</div>
</body>
</html>

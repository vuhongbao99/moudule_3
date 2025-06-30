<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh sách khách hàng</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<c:if test="${customers == null}">
  <p style="color:red;">
    Không tìm thấy dữ liệu. Hãy gọi URL <b>/customer</b> thay vì gọi trực tiếp JSP.
  </p>
</c:if>
<c:if test="${customers != null}">
  <table border="1">
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
    </tr>
    <c:forEach var="item" items="${customers}">
      <tr>
        <td>${item.name}</td>
        <td>${item.birthDate}</td>
        <td>${item.address}</td>
      </tr>
    </c:forEach>
  </table>
</c:if>
</body>
</html>

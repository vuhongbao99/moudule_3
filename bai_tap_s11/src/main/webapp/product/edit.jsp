<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<form action="/products" method="post">
  <input type="hidden" name="action" value="edit">
  <input type="hidden" name="id" value="${product.id}">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="${product.name}" required><br>
  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" value="${product.price}" required><br>
  <label for="description">Description:</label>
  <textarea id="description" name="description" required>${product.description}</textarea><br>
  <label for="manufacturer">Manufacturer:</label>
  <input type="text" id="manufacturer" name="manufacturer" value="${product.manufacturer}" required><br>
  <button type="submit">Update</button>
</form>
<a href="/products">Back to Product List</a>
</body>
</html>
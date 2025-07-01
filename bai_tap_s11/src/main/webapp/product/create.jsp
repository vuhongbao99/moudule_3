<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Create Product</title>
</head>
<body>
<h1>Create New Product</h1>
<form action="/products" method="post">
  <input type="hidden" name="action" value="create">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required><br>
  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" required><br>
  <label for="description">Description:</label>
  <textarea id="description" name="description" required></textarea><br>
  <label for="manufacturer">Manufacturer:</label>
  <input type="text" id="manufacturer" name="manufacturer" required><br>
  <button type="submit">Create</button>
</form>
<a href="/products">Back to Product List</a>
</body>
</html>
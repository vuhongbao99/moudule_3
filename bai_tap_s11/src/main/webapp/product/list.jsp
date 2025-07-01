<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product List</h1>
<form action="products" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" name="name" placeholder="Search by name" required>
    <button type="submit">Search</button>
</form>
<a href="products?action=create">
    <button>Create New Product</button>
</a>
<table style="border: 1px solid black; border-collapse: collapse; width: 100%;">
    <tr>
        <th style="border: 1px solid black;">ID</th>
        <th style="border: 1px solid black;">Name</th>
        <th style="border: 1px solid black;">Price</th>
        <th style="border: 1px solid black;">Description</th>
        <th style="border: 1px solid black;">Manufacturer</th>
        <th style="border: 1px solid black;">Actions</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td style="border: 1px solid black;">${product.id}</td>
            <td style="border: 1px solid black;">${product.name}</td>
            <td style="border: 1px solid black;">${product.price}</td>
            <td style="border: 1px solid black;">${product.description}</td>
            <td style="border: 1px solid black;">${product.manufacturer}</td>
            <td style="border: 1px solid black;">
                <a href="products?action=view&id=${product.id}">View</a>
                <a href="products?action=edit&id=${product.id}">Edit</a>
                <a href="products?action=delete&id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
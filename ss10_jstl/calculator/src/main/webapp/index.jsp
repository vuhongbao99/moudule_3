<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Ứng dụng Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 2rem;
        }
        .calculator-form {
            max-width: 400px;
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .calculator-form label {
            display: block;
            margin-top: 0.5rem;
        }
        .calculator-form input, .calculator-form select {
            width: 100%;
            padding: 0.5rem;
            margin-top: 0.25rem;
            box-sizing: border-box;
        }
        .calculator-form button {
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            font-size: 1rem;
        }
    </style>
</head>
<body>
<h2>Ứng dụng Calculator</h2>
<form class="calculator-form" method="post" action="calculate">
    <label for="operand1">Số thứ nhất:</label>
    <input type="text" id="operand1" name="operand1" required />

    <label for="operand2">Số thứ hai:</label>
    <input type="text" id="operand2" name="operand2" required />

    <label for="operator">Chọn phép toán:</label>
    <select id="operator" name="operator" required>
        <option value="+">Cộng (+)</option>
        <option value="-">Trừ (-)</option>
        <option value="*">Nhân (*)</option>
        <option value="/">Chia (/)</option>
    </select>

    <button type="submit">Tính</button>
</form>
</body>
</html>

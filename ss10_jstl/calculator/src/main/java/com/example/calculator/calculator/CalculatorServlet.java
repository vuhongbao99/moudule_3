package com.example.calculator.calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String sOperand1 = request.getParameter("operand1");
        String sOperand2 = request.getParameter("operand2");
        String operator  = request.getParameter("operator");

        String message = null;
        Double result = null;

        try {
            // Chuyển sang double
            double operand1 = Double.parseDouble(sOperand1);
            double operand2 = Double.parseDouble(sOperand2);

            // Gọi phương thức tính toán
            result = Calculator.calculate(operand1, operand2, operator);

        } catch (NumberFormatException ex) {
            message = "Giá trị nhập không hợp lệ. Vui lòng nhập số thực.";
        } catch (ArithmeticException ex) {
            message = ex.getMessage(); // Ví dụ: "Không thể chia cho 0"
        } catch (IllegalArgumentException ex) {
            message = ex.getMessage(); // Ví dụ: "Phép toán không hợp lệ"
        }

        // Chuyển sang JSP để hiển thị
        request.setAttribute("operand1", sOperand1);
        request.setAttribute("operand2", sOperand2);
        request.setAttribute("operator", operator);
        request.setAttribute("result", result);
        request.setAttribute("errorMessage", message);

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    // Nếu ai vô "/calculate" bằng GET, chuyển hướng về trang chính
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}

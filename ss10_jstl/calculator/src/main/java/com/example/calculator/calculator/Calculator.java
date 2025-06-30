package com.example.calculator.calculator;

public class Calculator {

    /**
     * Thực hiện phép tính giữa hai toán hạng a và b, với toán tử op.
     * @param a - số thứ nhất
     * @param b - số thứ hai
     * @param op - phép toán: "+", "-", "*", "/"
     * @return kết quả phép tính dưới dạng double
     * @throws ArithmeticException nếu chia cho 0
     * @throws IllegalArgumentException nếu op không hợp lệ
     */
    public static double calculate(double a, double b, String op)
            throws ArithmeticException, IllegalArgumentException {
        switch (op) {
            case "+":
                return a + b;
            case "-":
                return a - b;
            case "*":
                return a * b;
            case "/":
                if (b == 0) {
                    throw new ArithmeticException("Không thể chia cho 0");
                }
                return a / b;
            default:
                throw new IllegalArgumentException("Phép toán không hợp lệ: " + op);
        }
    }
}

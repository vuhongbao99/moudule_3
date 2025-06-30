package com.example.ss10_jstl_jsp.controller;

import com.example.ss10_jstl_jsp.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Huy",  "10-05-2003", "Da Nang"));
        customers.add(new Customer("Huy2", "10-05-2003", "Da Nang"));
        customers.add(new Customer("Huy3", "10-05-2003", "Da Nang"));
        customers.add(new Customer("Huy4", "10-05-2003", "Da Nang"));

        req.setAttribute("customers", customers);
        // Forward đến /views/index.jsp (phải tồn tại file đó)
        req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
    }
}

package com.app.medicine.controller;

import com.app.medicine.dao.PaymentDAO;
import com.app.medicine.model.Payment;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("view".equals(action)) {
            List<Payment> payments = PaymentDAO.getAllPayments();
            req.setAttribute("payments", payments);
            req.getRequestDispatcher("/payment/payment-history.jsp").forward(req, res);

        } else if ("add".equals(action)) {
            HttpSession session = req.getSession();

            @SuppressWarnings("unchecked")
            List<String> orderIds = (List<String>) session.getAttribute("checkoutOrderIds");
            Double amount = (Double) session.getAttribute("checkoutAmount");
            String userName = (String) session.getAttribute("loggedInUser");

            req.setAttribute("orderId", String.join(",", orderIds));
            req.setAttribute("orderAmount", amount);
            req.setAttribute("userName", userName);

            req.getRequestDispatcher("/payment/online-payment.jsp").forward(req, res);

        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("loggedInUser");
        double amount = Double.parseDouble(req.getParameter("amount"));
        String status = "Pending";

        // Create payment entry
        String paymentId = UUID.randomUUID().toString();
        Payment payment = new Payment(paymentId, orderId, userName, amount, status, LocalDateTime.now());
        PaymentDAO.addPayment(payment);

        // Redirect to dashboard after payment
        res.sendRedirect("dashboard");
    }
}
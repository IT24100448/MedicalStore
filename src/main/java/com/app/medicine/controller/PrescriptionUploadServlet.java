package com.app.medicine.controller;

import com.app.medicine.dao.OrderDAO;
import com.app.medicine.dao.PrescriptionDAO;
import com.app.medicine.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet("/uploadPrescription")
@MultipartConfig
public class PrescriptionUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("loggedInUser");
        String medicineId = req.getParameter("medicineId");

        Part filePart = req.getPart("prescriptionFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = req.getServletContext().getRealPath("/prescription/uploads/prescriptions");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        String prescriptionId = UUID.randomUUID().toString();
        LocalDateTime uploadedAt = LocalDateTime.now();
        String imageUrl = "prescription/view?file=" + fileName;
        Prescription p = new Prescription(prescriptionId, userName, medicineId, imageUrl, "Pending", uploadedAt);
        PrescriptionDAO.add(p);
        // You’ll implement this

        // Create pending order
        String orderId = UUID.randomUUID().toString();
        Order order = new Order(orderId, userName, medicineId, 1, "Pending", uploadedAt); // assuming qty = 1
        OrderDAO.add(order);

        res.sendRedirect("dashboard"); // Or show success message
    }
}

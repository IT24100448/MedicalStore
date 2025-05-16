package com.app.medicine.controller;

import com.app.medicine.dao.PrescriptionDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/rejectPrescription")
public class RejectPrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String prescriptionId = req.getParameter("prescriptionId");
        PrescriptionDAO.updateStatus(prescriptionId, "Rejected");
        res.sendRedirect("admin/view-prescription.jsp");
    }
}

package com.app.medicine.controller;

import com.app.medicine.dao.PrescriptionDAO;
import com.app.medicine.model.Prescription;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/approvePrescription")
public class ApprovePrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String prescriptionId = req.getParameter("prescriptionId");
        PrescriptionDAO.updateStatus(prescriptionId, "Approved");

        // Optional: update related order status
        Prescription p = PrescriptionDAO.findById(prescriptionId);
        if (p != null) {
            OrderDAO.updateStatusByUserAndMedicine(p.getUserName(), p.getMedicineId(), "Completed");
        }

        res.sendRedirect("prescription/view-prescription.jsp");
    }
}

package com.app.medicine.controller;

import com.app.medicine.dao.PrescriptionDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List;

@WebServlet("/prescription")
public class PrescriptionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");

        switch (action) {
            case "view":
                List<Prescription> list = PrescriptionDAO.getAll();
                req.setAttribute("prescriptions", list);
                req.getRequestDispatcher("/prescription/view-prescriptions.jsp").forward(req, res);
                break;

            case "approve":
            case "reject":
                Prescription p = PrescriptionDAO.findById(id);
                if (p != null) {
                    p.setStatus(action.equals("approve") ? "Approved" : "Rejected");
                    PrescriptionDAO.update(p);
                }
                res.sendRedirect("prescription?action=view");
                break;

            case "delete":
                PrescriptionDAO.delete(id);
                res.sendRedirect("prescription?action=view");
                break;

            default:
                res.sendRedirect("dashboard");
        }
    }
}

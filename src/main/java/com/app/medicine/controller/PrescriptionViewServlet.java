package com.app.medicine.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/prescription/view")
public class PrescriptionViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String fileName = req.getParameter("file");

        if (fileName == null || fileName.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing file parameter");
            return;
        }

        File file = new File(getServletContext().getRealPath("/prescription/uploads/prescriptions"), fileName);

        if (!file.exists()) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null) contentType = "application/octet-stream";

        res.setContentType(contentType);
        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = res.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
        }
    }
}

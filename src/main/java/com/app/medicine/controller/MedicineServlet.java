package com.app.medicine.controller;

import com.app.medicine.dao.MedicineDAO;
import com.app.medicine.dao.CategoryDAO;
import com.app.medicine.model.Medicine;

import com.app.medicine.util.MedicineUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/product")
public class MedicineServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");

        if ("edit".equals(action)) {
            Medicine product = MedicineDAO.findById(id);
            req.setAttribute("product", product);
            req.setAttribute("categories", CategoryDAO.getAllCategories());
            req.getRequestDispatcher("/medicine/medicine-form.jsp").forward(req, res);
            return;

        } else if ("add".equals(action)) {
            req.setAttribute("categories", CategoryDAO.getAllCategories());
            req.getRequestDispatcher("/medicine/medicine-form.jsp").forward(req, res);
            return;

        } else if ("delete".equals(action)) {
            MedicineDAO.delete(id);
            res.sendRedirect("product");
            return;
        }

        // Default: list products
        String sortBy = req.getParameter("sortBy");
        List<Medicine> products = MedicineDAO.getAll();

        if ("category".equals(sortBy)) {
            products = MedicineUtil.sortByCategory(products);
        } else if ("price".equals(sortBy)) {
            products = MedicineUtil.sortByPrice(products);
        }

        req.setAttribute("products", products);
        req.setAttribute("categories", CategoryDAO.getAllCategories());
        req.getRequestDispatcher("/medicine/medicine-list.jsp").forward(req, res);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("productName");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        if (id == null || id.isEmpty()) {
            id = UUID.randomUUID().toString();
            MedicineDAO.add(new Medicine(id, name, category, price, quantity));

        } else {
            MedicineDAO.update(new Medicine(id, name, category, price, quantity));
        }

        res.sendRedirect("product");
    }
}

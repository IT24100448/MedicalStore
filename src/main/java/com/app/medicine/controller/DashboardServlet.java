package com.app.medicine.controller;

import com.app.medicine.dao.CategoryDAO;
import com.app.medicine.dao.MedicineDAO;
import com.app.medicine.model.Medicine;
import com.app.medicine.util.MedicineUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String selectedCategory = req.getParameter("category");
        String sort = req.getParameter("sort");

        List<Medicine> products;

        if (selectedCategory != null && !selectedCategory.equalsIgnoreCase("All")) {
            products = MedicineDAO.getByCategory(selectedCategory); // assumes this method exists
        } else {
            products = MedicineDAO.getAll();
        }

        // Apply sorting based on parameter
        if ("price".equals(sort)) {
            products = MedicineUtil.sortByPrice(products);
        } else if ("category".equals(sort)) {
            products = MedicineUtil.sortByCategory(products);
        }

        req.setAttribute("products", products);
        req.setAttribute("categoryNames", CategoryDAO.getAllCategories());
        req.setAttribute("selectedCategory", selectedCategory);
        req.setAttribute("selectedSort", sort); // Pass to JSP to retain dropdown selection
        req.getRequestDispatcher("/dashboard/dashboard.jsp").forward(req, res);
    }
}

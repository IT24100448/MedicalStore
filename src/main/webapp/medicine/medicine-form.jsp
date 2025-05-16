<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.app.medicine.model.Medicine" %>
<%@ page import="java.util.List" %>
<%
    Medicine product = (Medicine) request.getAttribute("product");
    boolean isEdit = product != null;
%>
<html>
<head>
    <title><%= isEdit ? "Edit" : "Add" %> Medicine | MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#213448',
                        secondary: '#547792',
                        accent: '#94B4C1',
                        light: '#ECEFCA',
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-light min-h-screen p-6">
<div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md border border-accent">
    <div class="flex justify-between items-center mb-6">
        <div class="flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
            </svg>
            <h2 class="text-2xl font-bold text-primary"><%= isEdit ? "Edit" : "Add" %> Medicine</h2>
        </div>
        <a href="product" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back
        </a>
    </div>

    <form action="product" method="post" class="space-y-4">
        <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= product.getMedicineID() %>"/>
        <% } %>

        <div>
            <label class="block text-primary font-medium mb-1">Medicine Name</label>
            <input type="text" name="productName"
                   value="<%= isEdit ? product.getMedicineName() : "" %>"
                   required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Category</label>
            <select name="category" required class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent">
                <option value="">Select Category</option>
                <% List<String> categories = (List<String>) request.getAttribute("categories");
                    String selectedCategory = isEdit ? product.getCategory() : "";
                    for (String cat : categories) {
                %>
                <option value="<%= cat %>" <%= cat.equals(selectedCategory) ? "selected" : "" %>><%= cat %></option>
                <% } %>
            </select>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Price</label>
            <input type="number" step="0.01" name="price"
                   value="<%= isEdit ? product.getPrice() : "" %>"
                   required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Quantity</label>
            <input type="number" name="quantity"
                   value="<%= isEdit ? product.getQuantity() : "" %>"
                   required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <button type="submit" class="w-full bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <%= isEdit ? "Update" : "Save" %>
        </button>
    </form>
</div>
</body>
</html>
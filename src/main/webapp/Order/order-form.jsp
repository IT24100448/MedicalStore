<%@ page import="com.app.medicine.model.Medicine" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.medicine.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= request.getAttribute("order") == null ? "Create" : "Edit" %> Order | MediCare</title>
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
            </svg>
            <h2 class="text-2xl font-bold text-primary"><%= request.getAttribute("order") == null ? "Create" : "Edit" %> Order</h2>
        </div>
        <a href="order?action=view" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back
        </a>
    </div>

    <form method="post" action="order" class="space-y-4">
        <input type="hidden" name="id" value="<%= request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getOrderId() : "" %>"/>

        <div>
            <label class="block text-primary font-medium mb-1">Patient Name</label>
            <input type="text" name="userName" required
                   value="<%= request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getUserName() : "" %>"
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Medicine</label>
            <select name="productName" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent">
                <%
                    List<String> productNames = (List<String>) request.getAttribute("productNames");
                    String selectedProduct = request.getAttribute("order") != null
                            ? ((Order) request.getAttribute("order")).getMedicineName()
                            : "";
                    for (String pname : productNames) {
                %>
                <option value="<%= pname %>" <%= pname.equals(selectedProduct) ? "selected" : "" %>>
                    <%= pname %>
                </option>
                <% } %>
            </select>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Quantity</label>
            <input type="number" name="quantity" required min="1"
                   value="<%= request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getQuantity() : "" %>"
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Status</label>
            <select name="status" required class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent">
                <option value="pending" <%= "pending".equals(request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getStatus() : "") ? "selected" : "" %>>Pending</option>
                <option value="completed" <%= "completed".equals(request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getStatus() : "") ? "selected" : "" %>>Completed</option>
                <option value="canceled" <%= "canceled".equals(request.getAttribute("order") != null ? ((Order)request.getAttribute("order")).getStatus() : "") ? "selected" : "" %>>Canceled</option>
            </select>
        </div>

        <button type="submit" class="w-full bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition">
            <%= request.getAttribute("order") == null ? "Place" : "Update" %> Order
        </button>
    </form>
</div>
</body>
</html>

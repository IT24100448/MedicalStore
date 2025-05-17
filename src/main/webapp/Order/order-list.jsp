<%@ page import="com.app.medicine.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.app.medicine.model.Medicine" %>
<%@ page import="com.app.medicine.dao.MedicineDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders | MediCare</title>
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
<div class="max-w-6xl mx-auto">
    <div class="flex justify-between items-center mb-6">
        <div class="flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
            </svg>
            <h2 class="text-2xl font-bold text-primary">Order Management</h2>
        </div>
        <div class="flex space-x-3">
            <a href="order?action=add" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                </svg>
                Add Order
            </a>
            <a href="admin-dashboard" class="bg-accent hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                Dashboard
            </a>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-accent mb-8">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-primary text-white">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Order ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Patient</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Medicine</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Qty</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                        for (Order order : orders) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= order.getOrderId() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= order.getUserName() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= order.getMedicineName() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= order.getQuantity() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
              <span class="px-2 py-1 rounded-full text-xs
                <%= "completed".equals(order.getStatus()) ? "bg-green-100 text-green-800" :
                   "pending".equals(order.getStatus()) ? "bg-yellow-100 text-yellow-800" :
                   "bg-red-100 text-red-800" %>">
                <%= order.getStatus() %>
              </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <a href="order?action=edit&id=<%= order.getOrderId() %>" class="text-accent hover:text-secondary mr-3">Edit</a>
                        <a href="order?action=delete&id=<%= order.getOrderId() %>" class="text-red-500 hover:text-red-700">Delete</a>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="6" class="px-6 py-4 text-center text-sm text-gray-500">No orders found</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="grid md:grid-cols-2 gap-6">
        <div class="bg-white p-6 rounded-lg shadow-md border border-accent">
            <h3 class="text-lg font-bold text-primary mb-4 flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-accent" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                </svg>
                Processing Queue
            </h3>
            <%
                java.util.Queue<Order> queue = (java.util.Queue<Order>) request.getAttribute("queue");
                if (queue != null && !queue.isEmpty()) {
            %>
            <ul class="space-y-3">
                <% for (Order qOrder : queue) { %>
                <li class="border-b border-accent pb-3 last:border-0">
                    <div class="flex justify-between">
                        <span class="font-medium text-primary"><%= qOrder.getUserName() %></span>
                        <span class="text-sm <%= "completed".equals(qOrder.getStatus()) ? "text-green-600" :
                                 "pending".equals(qOrder.getStatus()) ? "text-yellow-600" :
                                 "text-red-600" %>">
              <%= qOrder.getStatus() %>
            </span>
                    </div>
                    <div class="text-sm text-primary"><%= qOrder.getMedicineName() %></div>
                    <div class="text-xs text-gray-500">Qty: <%= qOrder.getQuantity() %></div>
                </li>
                <% } %>
            </ul>
            <% } else { %>
            <p class="text-gray-500">No orders in the queue</p>
            <% } %>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-md border border-accent">
            <h3 class="text-lg font-bold text-primary mb-4 flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-accent" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                </svg>
                Current Cart Items
            </h3>
            <%
                Map<String, Integer> cart = (Map<String, Integer>) request.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
            %>
            <ul class="space-y-3">
                <%
                    for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                        String productId = entry.getKey();
                        int qty = entry.getValue();
                        Medicine p = MedicineDAO.findById(productId);
                        if (p != null) {
                %>
                <li class="border-b border-accent pb-3 last:border-0">
                    <div class="font-medium text-primary"><%= p.getMedicineName() %></div>
                    <div class="text-sm text-gray-500">Qty: <%= qty %></div>
                </li>
                <% } } %>
            </ul>
            <% } else { %>
            <p class="text-gray-500">Your cart is empty</p>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>

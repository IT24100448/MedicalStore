<%@ page import="java.util.*, com.app.medicine.model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Order History | MediCare</title>
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
<div class="max-w-4xl mx-auto">
    <div class="flex justify-between items-center mb-6">
        <div class="flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
            </svg>
            <h2 class="text-2xl font-bold text-primary">Your Order History</h2>
        </div>
        <a href="dashboard" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back
        </a>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-accent">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-primary text-white">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Order ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Medicine</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Quantity</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Order Date</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <%
                    List<Order> userOrders = (List<Order>) request.getAttribute("userOrders");
                    for (Order o : userOrders) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= o.getOrderId() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= o.getMedicineName() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= o.getQuantity() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
              <span class="px-2 py-1 rounded-full text-xs
                <%= "completed".equals(o.getStatus()) ? "bg-green-100 text-green-800" :
                   "pending".equals(o.getStatus()) ? "bg-yellow-100 text-yellow-800" :
                   "bg-red-100 text-red-800" %>">
                <%= o.getStatus() %>
              </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= o.getTimestamp() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

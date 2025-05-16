<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.app.medicine.model.Medicine" %>
<%
  List<Medicine> products = (List<Medicine>) request.getAttribute("products");
%>
<html>
<head>
  <title>Medicines | MediCare</title>
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
      <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
      </svg>
      <h2 class="text-2xl font-bold text-primary">Medicine Inventory</h2>
    </div>
    <div class="flex space-x-4">
      <a href="product?action=add" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
        </svg>
        Add Medicine
      </a>
      <a href="admin-dashboard" class="bg-accent hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
        </svg>
        Dashboard
      </a>
    </div>
  </div>

  <form method="get" action="product" class="mb-6 bg-white p-4 rounded-lg shadow-sm border border-accent">
    <div class="flex items-end space-x-4">
      <div class="flex-1">
        <label for="sortBy" class="block text-primary font-medium mb-1">Sort by:</label>
        <select name="sortBy" id="sortBy" class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-accent">
          <option value="">-- Select --</option>
          <option value="category" <%= "category".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Category</option>
          <option value="price" <%= "price".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Price</option>
        </select>
      </div>
      <input type="hidden" name="action" value="list"/>
      <button type="submit" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition">
        Apply
      </button>
    </div>
  </form>

  <div class="bg-white rounded-lg shadow-md overflow-hidden border border-accent">
    <table class="min-w-full divide-y divide-gray-200">
      <thead class="bg-primary text-white">
      <tr>
        <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Name</th>
        <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Category</th>
        <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Price</th>
        <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Quantity</th>
        <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
      </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
      <% for (Medicine p : products) { %>
      <tr class="hover:bg-gray-50">
        <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= p.getMedicineName() %></td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= p.getCategory() %></td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-primary">$<%= p.getPrice() %></td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-primary <%= p.getQuantity() > 0 ? "text-green-600" : "text-red-600" %>">
          <%= p.getQuantity() > 0 ? p.getQuantity() : "Out of Stock" %>
        </td>
        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
          <a href="product?action=edit&id=<%= p.getMedicineID() %>" class="text-accent hover:text-secondary mr-3">Edit</a>
          <a href="product?action=delete&id=<%= p.getMedicineID() %>" class="text-red-500 hover:text-red-700">Delete</a>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
<%@ page import="java.util.*, com.app.medicine.model.Prescription" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Prescriptions | MediCare</title>
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
            <h2 class="text-2xl font-bold text-primary">Prescription Management</h2>
        </div>
        <a href="admin-dashboard" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
            </svg>
            Dashboard
        </a>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-accent">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-primary text-white">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Patient</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Medicine ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Prescription</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <%
                    List<Prescription> list = (List<Prescription>) request.getAttribute("prescriptions");
                    for (Prescription p : list) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= p.getPrescriptionId() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= p.getUserName() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= p.getMedicineId() %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-primary">
                        <a href="<%= p.getImagePath() %>" target="_blank" class="text-accent hover:text-secondary">View</a>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
              <span class="px-2 py-1 rounded-full text-xs
                <%= "approved".equals(p.getStatus()) ? "bg-green-100 text-green-800" :
                   "pending".equals(p.getStatus()) ? "bg-yellow-100 text-yellow-800" :
                   "bg-red-100 text-red-800" %>">
                <%= p.getStatus() %>
              </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <a href="prescription?action=approve&id=<%= p.getPrescriptionId() %>" class="text-green-600 hover:text-green-800 mr-2">Approve</a>
                        <a href="prescription?action=reject&id=<%= p.getPrescriptionId() %>" class="text-red-500 hover:text-red-700 mr-2">Reject</a>
                        <a href="prescription?action=delete&id=<%= p.getPrescriptionId() %>" onclick="return confirm('Are you sure you want to delete this prescription?')" class="text-gray-500 hover:text-gray-700">Delete</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
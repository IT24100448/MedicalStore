<%@ page import="java.util.*, com.app.medicine.model.User" %>
<html>
<head>
    <title>Users | MediCare</title>
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            <h2 class="text-2xl font-bold text-primary">User Management</h2>
        </div>
        <div class="flex space-x-4">
            <a href="user?action=add" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                </svg>
                Add User
            </a>
            <a href="admin-dashboard" class="bg-accent hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                Dashboard
            </a>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-accent">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-primary text-white">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Email</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Phone</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Address</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                for (User u : users) {
            %>
            <tr class="hover:bg-gray-50">
                <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= u.getName() %></td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= u.getEmail() %></td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= u.getPhone() %></td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= u.getAddress() %></td>
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                    <a href="user?action=edit&id=<%= u.getId() %>" class="text-accent hover:text-secondary mr-3">Edit</a>
                    <a href="user?action=delete&id=<%= u.getId() %>" class="text-red-500 hover:text-red-700">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
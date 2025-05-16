<%@ page import="com.app.medicine.model.Category" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Categories | MediCare</title>
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
            <h2 class="text-2xl font-bold text-primary">Medicine Categories</h2>
        </div>
        <div class="flex space-x-4">
            <a href="category?action=add" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                </svg>
                Add Category
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
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Description</th>
                <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
            <% for (com.app.medicine.model.Category category : (List<Category>) request.getAttribute("categories")) { %>
            <tr class="hover:bg-gray-50">
                <td class="px-6 py-4 whitespace-nowrap text-sm text-primary"><%= category.getName() %></td>
                <td class="px-6 py-4 text-sm text-primary"><%= category.getDescription() %></td>
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                    <a href="category?action=edit&id=<%= category.getId() %>" class="text-accent hover:text-secondary mr-3">Edit</a>
                    <a href="category?action=delete&id=<%= category.getId() %>" class="text-red-500 hover:text-red-700">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
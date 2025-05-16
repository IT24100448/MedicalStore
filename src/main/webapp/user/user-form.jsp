<%@ page import="com.app.medicine.model.User" %>
<%
    User u = (User) request.getAttribute("user");
%>
<html>
<head>
    <title><%= (u == null ? "Add" : "Edit") %> User | MediCare</title>
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
            <h2 class="text-2xl font-bold text-primary"><%= (u == null ? "Add New" : "Edit") %> User</h2>
        </div>
        <a href="dashboard" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back
        </a>
    </div>

    <form method="post" action="user" class="space-y-4">
        <input type="hidden" name="id" value="<%= (u != null ? u.getId() : "") %>"/>

        <div>
            <label class="block text-primary font-medium mb-1">Full Name</label>
            <input type="text" name="name" value="<%= (u != null ? u.getName() : "") %>" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Email</label>
            <input type="email" name="email" value="<%= (u != null ? u.getEmail() : "") %>" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Phone</label>
            <input type="tel" name="phone" value="<%= (u != null ? u.getPhone() : "") %>" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Address</label>
            <input type="text" name="address" value="<%= (u != null ? u.getAddress() : "") %>" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Password</label>
            <input type="password" name="password" value="<%= (u != null ? u.getPassword() : "") %>" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <button type="submit" class="w-full bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            <%= (u != null ? "Update" : "Save") %>
        </button>
    </form>
</div>
</body>
</html>
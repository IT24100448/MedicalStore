<html>
<head>
    <title>MediCare - Sign Up</title>
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
<body class="bg-light min-h-screen flex items-center justify-center p-4">
<div class="max-w-md w-full bg-white p-8 rounded-lg shadow-md border border-accent">
    <div class="flex justify-center mb-6">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
        </svg>
    </div>
    <h2 class="text-2xl font-bold text-primary mb-6 text-center">Create Account</h2>
    <form method="post" action="user" class="space-y-4">
        <input type="hidden" name="action" value="signup" />

        <div>
            <label class="block text-primary font-medium mb-1">Full Name</label>
            <input type="text" name="name" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Email</label>
            <input type="email" name="email" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Phone</label>
            <input type="tel" name="phone" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Address</label>
            <input type="text" name="address" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Password</label>
            <input type="password" name="password" required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <button type="submit" class="w-full bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition">
            Create Account
        </button>

        <% if (request.getAttribute("error") != null) { %>
        <p class="text-red-500 text-center"><%= request.getAttribute("error") %></p>
        <% } %>
    </form>

    <div class="mt-4 text-center">
        <p class="text-primary">Already have an account? <a href="user?action=login" class="text-accent hover:text-secondary font-medium">Login</a></p>
    </div>
</div>
</body>
</html>
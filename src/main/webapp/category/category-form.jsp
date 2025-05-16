<html>
<head>
    <title><%= request.getAttribute("category") == null ? "Add" : "Edit" %> Category | MediCare</title>
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
            <h2 class="text-2xl font-bold text-primary"><%= request.getAttribute("category") == null ? "Add New" : "Edit" %> Category</h2>
        </div>
        <a href="category?action=view" class="bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back
        </a>
    </div>

    <form method="post" action="category" class="space-y-4">
        <input type="hidden" name="action" value="<%= request.getAttribute("category") == null ? "add" : "edit" %>" />
        <input type="hidden" name="id" value="<%= request.getAttribute("category") != null ? ((com.app.medicine.model.Category) request.getAttribute("category")).getId() : "" %>" />

        <div>
            <label class="block text-primary font-medium mb-1">Name</label>
            <input type="text" name="name"
                   value="<%= request.getAttribute("category") != null ? ((com.app.medicine.model.Category) request.getAttribute("category")).getName() : "" %>"
                   required
                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"/>
        </div>

        <div>
            <label class="block text-primary font-medium mb-1">Description</label>
            <textarea name="description" rows="3"
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-accent"><%= request.getAttribute("category") != null ? ((com.app.medicine.model.Category) request.getAttribute("category")).getDescription() : "" %></textarea>
        </div>

        <button type="submit" class="w-full bg-primary hover:bg-secondary text-white font-bold py-2 px-4 rounded transition flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
            Save
        </button>
    </form>
</div>
</body>
</html>
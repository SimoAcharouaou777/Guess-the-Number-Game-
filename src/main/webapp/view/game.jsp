<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/12/2024
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<!-- Main Dashboard Container -->
<div class="container mx-auto p-5">
    <h1 class="text-3xl font-bold text-gray-700 mb-5">User Dashboard</h1>

    <!-- Add User Button -->
    <button
            class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600"
            onclick="document.getElementById('addUserModal').classList.remove('hidden')">
        Add User
    </button>

    <!-- User Table -->
    <div class="mt-5">
        <table class="min-w-full bg-white rounded-md">
            <thead>
            <tr class="w-full bg-gray-200">
                <th class="py-2 px-4">ID</th>
                <th class="py-2 px-4">Name</th>
                <th class="py-2 px-4">Email</th>
                <th class="py-2 px-4">Actions</th>
            </tr>
            </thead>
            <tbody id="userTable">
            <!-- Example User Rows -->
            <c:forEach var="user" items="${users}">
            <tr class="border-b">
                <td class="py-2 px-4">${user.id}</td>
                <td class="py-2 px-4">${user.username}</td>
                <td class="py-2 px-4">${user.email}</td>
                <td class="py-2 px-4">
                    <button
                            class="bg-green-500 text-white px-2 py-1 rounded-md hover:bg-green-600"
                            onclick="document.getElementById('editUserModal').classList.remove('hidden')">
                        Edit
                    </button>
                    <button
                            class="bg-red-500 text-white px-2 py-1 rounded-md hover:bg-red-600"
                            onclick="document.getElementById('deleteUserModal').classList.remove('hidden')">
                        Delete
                    </button>
                </td>
            </tr>
            </c:forEach>
            <!-- More users will be added here dynamically -->
            </tbody>
        </table>
    </div>
</div>

<!-- Add User Modal -->
<div id="addUserModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white p-5 rounded-md w-1/3">
        <h2 class="text-xl font-bold mb-4">Add User</h2>
        <form method="post" action="${pageContext.request.contextPath}/addUser">
            <div class="mb-4">
                <label class="block text-gray-700">User name</label>
                <input type="text" class="w-full border border-gray-300 px-3 py-2 rounded-md" name="username" id="username" placeholder="User Name">
            </div>
            <div class="mb-4">
                <label class="block text-gray-700">Email</label>
                <input type="email" class="w-full border border-gray-300 px-3 py-2 rounded-md" name="email" id="email" placeholder="User Email">
            </div>
            <div class="flex justify-end">
                <button type="button"
                        class="bg-gray-500 text-white px-4 py-2 rounded-md mr-2"
                        onclick="document.getElementById('addUserModal').classList.add('hidden')">
                    Cancel
                </button>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md">Add</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit User Modal -->
<div id="editUserModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white p-5 rounded-md w-1/3">
        <h2 class="text-xl font-bold mb-4">Edit User</h2>
        <form>
            <div class="mb-4">
                <label class="block text-gray-700">Name</label>
                <input type="text" class="w-full border border-gray-300 px-3 py-2 rounded-md" value="John Doe">
            </div>
            <div class="mb-4">
                <label class="block text-gray-700">Email</label>
                <input type="email" class="w-full border border-gray-300 px-3 py-2 rounded-md" value="john.doe@example.com">
            </div>
            <div class="flex justify-end">
                <button type="button"
                        class="bg-gray-500 text-white px-4 py-2 rounded-md mr-2"
                        onclick="document.getElementById('editUserModal').classList.add('hidden')">
                    Cancel
                </button>
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md">Save</button>
            </div>
        </form>
    </div>
</div>

<!-- Delete User Modal -->
<div id="deleteUserModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white p-5 rounded-md w-1/3">
        <h2 class="text-xl font-bold mb-4">Delete User</h2>
        <p class="text-gray-700 mb-4">Are you sure you want to delete this user?</p>
        <div class="flex justify-end">
            <button type="button"
                    class="bg-gray-500 text-white px-4 py-2 rounded-md mr-2"
                    onclick="document.getElementById('deleteUserModal').classList.add('hidden')">
                Cancel
            </button>
            <button type="button" class="bg-red-500 text-white px-4 py-2 rounded-md">Delete</button>
        </div>
    </div>
</div>
</body>
</html>


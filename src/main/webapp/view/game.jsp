<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guess the Number Game</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-200">
<div class="container mx-auto mt-10">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <h1 class="text-2xl font-bold mb-5 text-center">Guess the Number Game</h1>

        <form action="${pageContext.request.contextPath}/game" method="post">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="guess">
                    Enter a guess between 1 and 100:
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       type="number" id="guess" name="guess" min="1" max="100" required>
            </div>

            <div class="flex items-center justify-between">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                        type="submit">
                    Submit Guess
                </button>
            </div>
        </form>

        <div class="mt-5">
            <% String message = (String) request.getAttribute("message"); %>
            <% if (message != null) { %>
            <p class="text-center text-lg font-bold"><%= message %></p>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
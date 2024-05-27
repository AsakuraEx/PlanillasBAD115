<%-- 
    Document   : register
    Created on : 26 may 2024, 7:54:31 p.m.
    Author     : frane
--%>

<%@page import="Controllers.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrate</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white p-8 rounded-lg shadow-lg w-96">
            <h2 class="text-2xl font-bold mb-6 text-center">Registrate</h2>
            <form action="register.jsp" method="post">
                <div class="mb-4">
                    <label for="username" class="block text-gray-700">Nombre de usuario:</label>
                    <input type="text" id="username" name="usuario" class="w-full p-2 border border-gray-300 rounded mt-1" required>
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-gray-700">Correo Electronico:</label>
                    <input type="email" id="email" name="email" class="w-full p-2 border border-gray-300 rounded mt-1" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-gray-700">Contraseña:</label>
                    <input type="password" id="password" name="password" class="w-full p-2 border border-gray-300 rounded mt-1" required>
                </div>
                <div class="mb-4">
                    <label for="confirm_password" class="block text-gray-700">Confirmar contraseña:</label>
                    <input type="password" id="confirm_password" name="confirm_password" class="w-full p-2 border border-gray-300 rounded mt-1" required>
                </div>
                <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded mt-4">Registrarse</button>
            </form>
            <div id="error_message" class="text-red-500 mt-4">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p><%= request.getAttribute("errorMessage") %></p>
                <% } %>
            </div>
            <p>¿Ya posees una cuenta? <a class="text-[#80BF96] hover:text-[#568a68]" href="./login.jsp">Inicia Sesion</a>.</p>
        </div>
        <%
            String errorMessage = null;
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String usuario = request.getParameter("usuario");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirm_password");

                if (!password.equals(confirmPassword)) {
                    errorMessage = "Las contraseñas no coinciden.";
                } else {
                    
                    UsuarioController userController = new UsuarioController();
                    userController.create(usuario, email, password);
                    
                    response.sendRedirect("./login.jsp");
                  
                }
            }
            request.setAttribute("errorMessage", errorMessage);
        %>
    </body>
</html>

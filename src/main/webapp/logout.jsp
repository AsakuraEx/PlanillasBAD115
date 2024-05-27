<%-- 
    Document   : logout
    Created on : 26 may 2024, 9:14:24 p.m.
    Author     : frane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Invalidar la sesión actual
            if (session != null) {
                session.invalidate();
            }

            // Redirigir al usuario a la página de login
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>

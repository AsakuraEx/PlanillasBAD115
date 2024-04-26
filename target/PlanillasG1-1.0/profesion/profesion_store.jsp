<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.ProfesionController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String nombreprofesion = request.getParameter("nombreprofesion");
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            ProfesionController controller = new ProfesionController();
            controller.create(nombreprofesion, habilitado);
            
            response.sendRedirect("profesion_index.jsp");
        %>
    </body>
</html>

<%-- 
    Document   : unidadorganizativa_update
    Created on : 23 abr 2024, 5:37:59 p.m.
    Author     : frane
--%>

<%@page import="Controllers.ProfesionController"%>
<%@page import="Models.Profesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String nombre, habilitado;

            int id = Integer.parseInt(request.getParameter("id"));          
            nombre = request.getParameter("nombreprofesion");
            habilitado = request.getParameter("habilitado");
            
            Profesion profesion = new Profesion();
            profesion.setId_profesion(id);
            profesion.setNombreprofesion(nombre);
            profesion.setHabilitado(habilitado);
            
            
            ProfesionController controller = new ProfesionController();
            controller.update(profesion);
            
            response.sendRedirect("profesion_index.jsp");
            
        
        %>
    </body>
</html>

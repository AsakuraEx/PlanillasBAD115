<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.UnidadorgController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String nombreunidad = request.getParameter("nombreunidadorg");
            int id_empresa = Integer.parseInt(request.getParameter("id_empresa"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            UnidadorgController controller = new UnidadorgController();
            controller.create(nombreunidad, id_empresa, habilitado);
            
            response.sendRedirect("unidadorganizativa_index.jsp");
        %>
    </body>
</html>

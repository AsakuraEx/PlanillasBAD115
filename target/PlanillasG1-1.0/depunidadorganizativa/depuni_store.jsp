<%-- 
    Document   : depuni_store
    Created on : 25 abr 2024, 8:39:31 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String nombreunidad = request.getParameter("nombredeporg");
            int id_unidadorg = Integer.parseInt(request.getParameter("id_unidadorg"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            DepUnidadOrganiController controller = new DepUnidadOrganiController();
            controller.create(nombreunidad,id_unidadorg, habilitado);
            
            response.sendRedirect("depuni_index.jsp");
        %>
    </body>
</html>

<%-- 
    Document   : depuni_store
    Created on : 25 abr 2024, 8:39:31 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SeccionesUnidadOrganiController"%>
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
            String NOMBRESECCIONUNIORG = request.getParameter("NOMBRESECCIONUNIORG");
            int ID_AREAUNIDADORG = Integer.parseInt(request.getParameter("ID_AREAUNIDADORG"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            SeccionesUnidadOrganiController controller = new SeccionesUnidadOrganiController();
            controller.create(NOMBRESECCIONUNIORG,ID_AREAUNIDADORG, habilitado);
            
            response.sendRedirect("secuni_index.jsp");
        %>
    </body>
</html>

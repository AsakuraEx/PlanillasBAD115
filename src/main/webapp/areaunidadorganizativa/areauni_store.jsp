<%-- 
    Document   : depuni_store
    Created on : 25 abr 2024, 8:39:31 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String NOMBREAREAUNIDADORG = request.getParameter("NOMBREAREAUNIDADORG");
            int ID_DEPORG = Integer.parseInt(request.getParameter("ID_DEPORG"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            AreaUnidadOrganiController controller = new AreaUnidadOrganiController();
            controller.create(NOMBREAREAUNIDADORG,ID_DEPORG, habilitado);
            
            response.sendRedirect("areauni_index.jsp");
        %>
    </body>
</html>

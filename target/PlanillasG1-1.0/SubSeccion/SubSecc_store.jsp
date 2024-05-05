<%-- 
    Document   : depuni_store
    Created on : 25 abr 2024, 8:39:31 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SubSeccionesUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String NOMBRESUBSECUNIORG = request.getParameter("NOMBRESUBSECUNIORG");
            int ID_SECCIONUNIORG = Integer.parseInt(request.getParameter("ID_SECCIONUNIORG"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            SubSeccionesUnidadOrganiController controller = new SubSeccionesUnidadOrganiController();
            controller.create(NOMBRESUBSECUNIORG,ID_SECCIONUNIORG, habilitado);
            
            response.sendRedirect("SubSecc_index.jsp");
        %>
    </body>
</html>

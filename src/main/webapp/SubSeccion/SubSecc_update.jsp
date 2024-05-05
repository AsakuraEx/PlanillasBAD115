<%-- 
    Document   : depuni_update
    Created on : 25 abr 2024, 8:39:42 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SubSeccionesUnidadOrganiController"%>
<%@page import="Models.SubSeccionesUnidadOrgani"%>
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
            int ID_SECCIONUNIORG = Integer.parseInt(request.getParameter("ID_SECCIONUNIORG"));            
            nombre = request.getParameter("NOMBRESUBSECUNIORG");
            habilitado = request.getParameter("habilitado");
            
            SubSeccionesUnidadOrgani subseccion = new SubSeccionesUnidadOrgani();
            subseccion.setID_SUBSECUNIORG(id);
            subseccion.setNOMBRESUBSECUNIORG(nombre);
            subseccion.setID_SECCIONUNIORG(ID_SECCIONUNIORG);
            subseccion.setHabilitado(habilitado);
            
            
            SubSeccionesUnidadOrganiController controller = new SubSeccionesUnidadOrganiController();
            controller.update(subseccion);
            
            response.sendRedirect("SubSecc_index.jsp");
            
        
        %>
    </body>
</html>
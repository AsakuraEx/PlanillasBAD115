<%-- 
    Document   : depuni_update
    Created on : 25 abr 2024, 8:39:42 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
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
            int ID_AREAUNIDADORG = Integer.parseInt(request.getParameter("ID_AREAUNIDADORG"));            
            nombre = request.getParameter("NOMBRESECCIONUNIORG");
            habilitado = request.getParameter("habilitado");
            
            SeccionesUnidadOrgani seccion = new SeccionesUnidadOrgani();
            seccion.setID_SECCIONUNIORG(id);
            seccion.setNOMBRESECCIONUNIORG(nombre);
            seccion.setID_AREAUNIDADORG(ID_AREAUNIDADORG);
            seccion.setHabilitado(habilitado);
            
            
            SeccionesUnidadOrganiController controller = new SeccionesUnidadOrganiController();
            controller.update(seccion);
            
            response.sendRedirect("secuni_index.jsp");
            
        
        %>
    </body>
</html>
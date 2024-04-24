<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.TipoIngreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String nombretipoingreso, habilitado;

            int id = Integer.parseInt(request.getParameter("id"));            
            nombretipoingreso = request.getParameter("nombretipoingreso");
            habilitado = request.getParameter("habilitado");
            
            TipoIngreso tipoingreso = new TipoIngreso();
            tipoingreso.setId_tipoingreso(id);
            tipoingreso.setNombretipoingreso(nombretipoingreso);
            tipoingreso.setHabilitado(habilitado);
            
            TipoIngresoController controller = new TipoIngresoController();
            controller.update(tipoingreso);
            
            response.sendRedirect("tipoingreso_index.jsp");
            
        
        %>
    </body>
</html>

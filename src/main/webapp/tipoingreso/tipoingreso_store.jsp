<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoIngresoController"  %>
<% 
    // Obtener información del formulario
    String nombreTipoIngreso = request.getParameter("nombretipoingreso");
    String habilitado = request.getParameter("habilitado");

    // Crear instancia del controlador y llamar al método para guardar la información
    TipoIngresoController controller = new TipoIngresoController();
    //controller.tipoIngresoStore(new TipoIngreso(nombreTipoIngreso, habilitado));
    boolean insercion = controller.create(nombreTipoIngreso, habilitado);
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
            response.sendRedirect("tipoingreso_index.jsp");

        %>
    </body> 
</html>

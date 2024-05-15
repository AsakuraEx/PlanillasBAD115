<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DescuentoController"%>
<%@page import="Controllers.IngresoController"%>
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
            int id_empleado = Integer.parseInt(request.getParameter("id_empleado")); 
            int id_tipodescuento = Integer.parseInt(request.getParameter("id_tipodescuento"));   
            float descuento = Float.parseFloat(request.getParameter("descuento"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            DescuentoController controller = new DescuentoController();
            controller.create(id_empleado, id_tipodescuento, descuento, habilitado);
            
            response.sendRedirect("descuento_index.jsp");
        %>
    </body>
</html>

<%-- 
    Document   : unidadorganizativa_update
    Created on : 23 abr 2024, 5:37:59 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DescuentoController"%>
<%@page import="Models.Descuento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String habilitado;

            int id = Integer.parseInt(request.getParameter("id"));
            double DESCUENTO = Double.parseDouble(request.getParameter("DESCUENTO"));          
            habilitado = request.getParameter("habilitado");
            
            Descuento descu = new Descuento();
            descu.setID_DESCUENTO(id);
            descu.setDESCUENTO(DESCUENTO);
            descu.setHabilitado(habilitado);
            
            
            DescuentoController controller = new DescuentoController();
            controller.update(descu);
            
            response.sendRedirect("descuento2_index.jsp");
            
        
        %>
    </body>
</html>

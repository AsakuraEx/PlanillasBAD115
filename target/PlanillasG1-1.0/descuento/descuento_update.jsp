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

            int id2 = Integer.parseInt(request.getParameter("id2"));
            int id = Integer.parseInt(request.getParameter("id"));
            float DESCUENTO = Float.parseFloat(request.getParameter("DESCUENTO"));         
            habilitado = request.getParameter("habilitado");
            
            
            Descuento descu = new Descuento();
            descu.setID_DESCUENTO(id2);
            descu.setDESCUENTO(DESCUENTO);
            descu.setID_EMPLEADO(id);
            descu.setHabilitado(habilitado);    
            DescuentoController controller = new DescuentoController();
            controller.update(descu);
            //response.sendRedirect("descuento2_index.jsp");
            // Guardar el objeto descuento en el request
            request.setAttribute("descuentoActualizado", descu.getID_EMPLEADO());
        
            // Redireccionar a la página de destino
            request.getRequestDispatcher("descuento2_index.jsp").forward(request, response);
            
        %>

    </body>
</html>

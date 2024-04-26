<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.PuestoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String nombrepuesto = request.getParameter("nombrepuesto");
            float salariominimo = Float.parseFloat(request.getParameter("salariominimo"));
            float salariomaximo = Float.parseFloat(request.getParameter("salariomaximo"));
            int id_unidadorg = Integer.parseInt(request.getParameter("id_unidadorg"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            PuestoController controller = new PuestoController();
            controller.create(nombrepuesto, salariominimo, salariomaximo, id_unidadorg, habilitado);
            
            response.sendRedirect("puesto_index.jsp");
        %>
    </body>
</html>

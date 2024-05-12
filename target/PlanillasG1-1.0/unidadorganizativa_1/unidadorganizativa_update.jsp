<%-- 
    Document   : unidadorganizativa_update
    Created on : 23 abr 2024, 5:37:59 p.m.
    Author     : frane
--%>

<%@page import="Controllers.UnidadorgController"%>
<%@page import="Models.Unidadorganizativa"%>
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
            int id_empresa = Integer.parseInt(request.getParameter("id_empresa"));            
            nombre = request.getParameter("nombreunidadorg");
            habilitado = request.getParameter("habilitado");
            
            Unidadorganizativa unidad = new Unidadorganizativa();
            unidad.setId_unidadorg(id);
            unidad.setNombreunidadorg(nombre);
            unidad.setId_empresa(id_empresa);
            unidad.setHabilitado(habilitado);
            
            
            UnidadorgController controller = new UnidadorgController();
            controller.update(unidad);
            
            response.sendRedirect("unidadorganizativa_index.jsp");
            
        
        %>
    </body>
</html>

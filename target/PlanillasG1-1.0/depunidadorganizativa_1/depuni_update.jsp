<%-- 
    Document   : depuni_update
    Created on : 25 abr 2024, 8:39:42 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
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
            int id_unidadorg = Integer.parseInt(request.getParameter("id_unidadorg"));            
            nombre = request.getParameter("nombredeporg");
            habilitado = request.getParameter("habilitado");
            
            DepUnidadOrgani unidad = new DepUnidadOrgani();
            unidad.setId_deporg(id);
            unidad.setNombredeporg(nombre);
            unidad.setId_unidadorg(id_unidadorg);
            unidad.setHabilitado(habilitado);
            
            
            DepUnidadOrganiController controller = new DepUnidadOrganiController();
            controller.update(unidad);
            
            response.sendRedirect("depuni_index.jsp");
            
        
        %>
    </body>
</html>
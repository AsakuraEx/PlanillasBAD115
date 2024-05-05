<%-- 
    Document   : depuni_update
    Created on : 25 abr 2024, 8:39:42 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page import="Models.AreaUnidadOrgani"%>
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
            int ID_DEPORG = Integer.parseInt(request.getParameter("ID_DEPORG"));            
            nombre = request.getParameter("NOMBREAREAUNIDADORG");
            habilitado = request.getParameter("habilitado");
            
            AreaUnidadOrgani area = new AreaUnidadOrgani();
            area.setID_AREAUNIDADORG(id);
            area.setNOMBREAREAUNIDADORG(nombre);
            area.setID_DEPORG(ID_DEPORG);
            area.setHabilitado(habilitado);
            
            
            AreaUnidadOrganiController controller = new AreaUnidadOrganiController();
            controller.update(area);
            
            response.sendRedirect("areauni_index.jsp");
            
        
        %>
    </body>
</html>
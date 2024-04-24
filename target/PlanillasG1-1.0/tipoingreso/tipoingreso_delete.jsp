<%-- 
    Document   : TipoIngreso_delete
    Created on : 18 abr 2024, 11:07:28 a.m.
    Author     : Juanjo
--%>

<%@page import="Models.TipoIngreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*
            ESTO SE UTILIZA PARA BORRAR EL REGISTRO COMPLETAMENTE
            
            int id = Integer.parseInt(request.getParameter("id"));
            EmpresaController controller = new EmpresaController();
            controller.delete(id);
            */
            
            int id = Integer.parseInt(request.getParameter("id"));
            String habilitado = request.getParameter("habilitado");
            
            TipoIngresoController controller = new TipoIngresoController();
            TipoIngreso tipoingreso = new TipoIngreso();
            tipoingreso = controller.search(id);
            tipoingreso.setId_tipoingreso(id);
            tipoingreso.setHabilitado(habilitado);

            controller.delete(tipoingreso);
            
            response.sendRedirect("tipoingreso_index.jsp");
        
        %>
    </body>
</html>

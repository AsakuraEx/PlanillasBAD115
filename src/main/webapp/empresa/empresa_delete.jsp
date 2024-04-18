<%-- 
    Document   : empresa_delete
    Created on : 18 abr 2024, 11:07:28 a.m.
    Author     : frane
--%>

<%@page import="Models.Empresa"%>
<%@page import="Controllers.EmpresaController"%>
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
            
            EmpresaController controller = new EmpresaController();
            Empresa empresa = new Empresa();
            empresa = controller.search(id);
            empresa.setId_empresa(id);
            empresa.setHabilitado(habilitado);

            controller.delete(empresa);
            
            response.sendRedirect("empresa_index.jsp");
        
        %>
    </body>
</html>

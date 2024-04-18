<%-- 
    Document   : empresa_delete
    Created on : 18 abr 2024, 11:07:28 a.m.
    Author     : frane
--%>

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
        
            int id = Integer.parseInt(request.getParameter("id"));
            EmpresaController controller = new EmpresaController();
            controller.delete(id);
            
            response.sendRedirect("empresa_index.jsp");
        
        %>
    </body>
</html>

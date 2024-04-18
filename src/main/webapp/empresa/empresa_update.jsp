<%-- 
    Document   : empresa_update
    Created on : 18 abr 2024, 11:34:37 a.m.
    Author     : frane
--%>

<%@page import="Controllers.EmpresaController"%>
<%@page import="Models.Empresa"%>
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
            String nombre, correo, direccion, nic, nit, telefono, paginaweb;
            
            nombre = request.getParameter("nombreempresa");
            correo = request.getParameter("correoempresa");
            direccion = request.getParameter("direccion");
            nic = request.getParameter("nic");
            nit = request.getParameter("nit");
            telefono = request.getParameter("telefono");
            paginaweb = request.getParameter("paginaweb");
            
            Empresa empresa = new Empresa();
            empresa.setId_empresa(id);
            empresa.setNombreempresa(nombre);
            empresa.setCorreoempresa(correo);
            empresa.setDireccion(direccion);
            empresa.setNic(nic);
            empresa.setNit(nit);
            empresa.setTelefono(telefono);
            empresa.setPaginaweb(paginaweb);

            
            EmpresaController controller = new EmpresaController();
            controller.update(empresa);
            
            response.sendRedirect("empresa_index.jsp");
            
        
        %>
    </body>
</html>

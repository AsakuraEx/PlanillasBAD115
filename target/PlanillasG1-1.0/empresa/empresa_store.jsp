<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.EmpresaController"  %>
        <% 
            //Obtener informacion del formulario
           String nombre = request.getParameter("nombreempresa");
           String correo = request.getParameter("correoempresa");
           String direccion = request.getParameter("direccion");
           String nic = request.getParameter("nic");
           String nit = request.getParameter("nit");
           String telefono = request.getParameter("telefono");
           String paginaweb = request.getParameter("paginaweb");

           //Crear instancia del controlador y llamar al metodo create para guardar la informacion
           EmpresaController controller = new EmpresaController();
           boolean insercion = controller.create(nombre, correo, direccion, telefono, nic, nit, paginaweb);
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Empresa</title>
    </head>
    <body>
       

        <% 
        
            response.sendRedirect("empresa_index.jsp");

        %>
        
    </body>
</html>

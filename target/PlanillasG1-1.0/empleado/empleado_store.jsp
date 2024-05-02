<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DocumentoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String primernombre = request.getParameter("primernombre");
            String segundonombre = request.getParameter("segundonombre");            
            String primerapellido = request.getParameter("primerapellido");
            String segundoapellido = request.getParameter("segundoapellido");
            String apellidocasada = request.getParameter("apellidocasada");            
            LocalDate fechanacimiento = LocalDate.parse(request.getParameter("fechanacimiento"));
            double salario = Double.parseDouble(request.getParameter("salario"));
            String correopersonal = request.getParameter("correopersonal");
            String correoinstitucional = request.getParameter("correoinstitucional");
            int id_sexo = Integer.parseInt(request.getParameter("id_sexo"));
            int id_estadocivil = Integer.parseInt(request.getParameter("id_estadocivil"));            
            int id_profesion = Integer.parseInt(request.getParameter("id_profesion"));
            int id_puesto = Integer.parseInt(request.getParameter("id_puesto"));
            int id_municipio = Integer.parseInt(request.getParameter("id_municipio"));
            String habilitado = request.getParameter("habilitado");
            
            String nit = request.getParameter("nit");
            String nup = request.getParameter("nup");
            String numeroisss = request.getParameter("numeroisss");
            int id_tipodoc = Integer.parseInt(request.getParameter("id_tipodocumento"));
            String ndocumento = request.getParameter("ndocumento"); 
            //Crear el registro en la base de datos
            EmpleadoController controller = new EmpleadoController();
            Empleado empleado = new Empleado();
            empleado = controller.create(primernombre, segundonombre, primerapellido, segundoapellido, apellidocasada, fechanacimiento, salario, correopersonal,
            correoinstitucional, id_sexo, id_estadocivil, id_profesion, id_puesto, id_municipio, habilitado, nup, nit, numeroisss);
            
            DocumentoController controllerDoc = new DocumentoController();
            controllerDoc.create(empleado,id_tipodoc, ndocumento, habilitado);
            
            response.sendRedirect("empleado_index.jsp");
        %>
        
        
    </body>
</html>

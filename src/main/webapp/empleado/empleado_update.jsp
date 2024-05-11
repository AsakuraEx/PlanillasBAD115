<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DocumentoController"%>
<%@page import="Models.Documento"%>
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
            int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
            String primernombre = request.getParameter("primernombre");
            String segundonombre = request.getParameter("segundonombre");            
            String primerapellido = request.getParameter("primerapellido");
            String segundoapellido = request.getParameter("segundoapellido");
            String apellidocasada = request.getParameter("apellidocasada");            
            LocalDate fechanacimiento = LocalDate.parse(request.getParameter("fechanacimiento"));
            LocalDate fechaingresosistema = LocalDate.parse(request.getParameter("fechaingresosistema"));
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
            
            Empleado empleado = new Empleado();
            empleado.setId_empleado(id_empleado);
            empleado.setId_estadocivil(id_estadocivil);
            empleado.setId_municipio(id_municipio);
            empleado.setId_profesion(id_profesion);
            empleado.setId_puesto(id_puesto);
            empleado.setId_sexo(id_sexo);
            
            empleado.setPrimernombre(primernombre);
            empleado.setPrimerapellido(primerapellido);
            empleado.setSegundonombre(segundonombre);
            empleado.setSegundoapellido(segundoapellido);
            empleado.setApellidocasada(apellidocasada);
            empleado.setFechanacimiento(fechanacimiento);
            empleado.setFechaingresosistema(fechaingresosistema);
            empleado.setSalario(salario);
            empleado.setCorreopersonal(correopersonal);
            empleado.setCorreoinstitucional(correoinstitucional);
            empleado.setHabilitado(habilitado);
            
            empleado.setNit(nit);
            empleado.setNumeroisss(numeroisss);
            empleado.setNup(nup);
            int id_tipodocumento = Integer.parseInt(request.getParameter("id_tipodocumento"));
            String ndocumento = request.getParameter("ndocumento");   
            
            //Crear el registro en la base de datos
            EmpleadoController controller = new EmpleadoController();
            Empleado empleadoAct = new Empleado();
            empleadoAct = controller.update(empleado);

            
            Documento doc = new Documento();
            doc.setId_tipodocumento(id_tipodocumento);
            doc.setNumerodocumento(ndocumento);
            
            DocumentoController controllerDoc = new DocumentoController();
            controllerDoc.update(empleadoAct,doc);
            
            response.sendRedirect("empleado_index.jsp");
        %>
        
    </body>
</html>

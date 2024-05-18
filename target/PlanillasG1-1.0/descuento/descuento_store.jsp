<%-- 
    Document   : unidadorganizativa-store
    Created on : 22 abr 2024, 9:04:45 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DescuentoController"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int id_empleado = Integer.parseInt(request.getParameter("id")); 
            int id_tipodescuento = Integer.parseInt(request.getParameter("ID_TIPODESCUENTO"));   
            float descuento = Float.parseFloat(request.getParameter("DESCUENTO"));
            String habilitado = request.getParameter("habilitado");
            
            
            Empleado em =new Empleado();
            EmpleadoController cont =new EmpleadoController();
            em=cont.search(id_empleado);
            
            
            //Crear el registro en la base de datos
            DescuentoController controller = new DescuentoController();
            controller.create(id_empleado, id_tipodescuento, descuento, habilitado);
            //response.sendRedirect("descuento2_index.jsp"+id_empleado);
            request.setAttribute("id",em.getId_empleado()); // Cambia 123 al número que desees devolver
    
            // Redirigir a la vista descuento2_index.jsp
            request.getRequestDispatcher("descuento2_index.jsp").forward(request, response);
        %>
    </body>
</html>

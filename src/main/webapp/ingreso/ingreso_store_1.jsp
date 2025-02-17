<%@page import="java.time.LocalDate"%>
<%@page import="Controllers.IngresoController"%>
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
            int id_tipoingreso = Integer.parseInt(request.getParameter("id_tipoingreso"));
            LocalDate fechaingreso = LocalDate.parse(request.getParameter("fechaingreso"));
            float ingreso = Float.parseFloat(request.getParameter("ingreso"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            IngresoController controller = new IngresoController();
            controller.create(id_empleado, id_tipoingreso,fechaingreso, ingreso, habilitado);
            
            response.sendRedirect("/PlanillasG1/descuento/descuento_index.jsp");
        %>
    </body>
</html>

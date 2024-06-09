<%@page import="java.time.LocalDate"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.PuestoController"%>
<%@page import="Models.Puesto"%>
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
            int id_ingreso = Integer.parseInt(request.getParameter("id_ingreso")); 
            int id_tipoingreso = Integer.parseInt(request.getParameter("id_tipoingreso")); 
            float ingreso = Float.parseFloat(request.getParameter("ingreso")); 
            LocalDate fechaingreso = LocalDate.parse(request.getParameter("fechaingreso"));
            String habilitado = request.getParameter("habilitado");
            
            Ingreso ing = new Ingreso();
            ing.setId_empleado(id_empleado);
            ing.setId_tipoingreso(id_tipoingreso);
            ing.setId_ingreso(id_ingreso);
            ing.setIngreso(ingreso);
            ing.setFechaingreso(fechaingreso);
            ing.setHabilitado(habilitado);

            IngresoController controller = new IngresoController();
            controller.update(ing);
            
            response.sendRedirect("/PlanillasG1/descuento/descuento_index.jsp");
            
        
        %>
    </body>
</html>

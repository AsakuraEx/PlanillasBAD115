
<%@page import="Controllers.PresupuestoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int id_deporg = Integer.parseInt(request.getParameter("id_deporg"));
            int id_mes = Integer.parseInt(request.getParameter("id_mes"));
            float monto = Float.parseFloat(request.getParameter("monto"));
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            PresupuestoController controller = new PresupuestoController();
            controller.create(id_deporg, id_mes, monto, habilitado);
            
            response.sendRedirect("presupuesto_index.jsp");
        %>
    </body>
</html>

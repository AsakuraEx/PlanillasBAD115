<%@page import="Controllers.PresupuestoController"%>
<%@page import="Models.Presupuesto"%>
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
            int id_deporg = Integer.parseInt(request.getParameter("id_deporg"));
            int id_mes = Integer.parseInt(request.getParameter("id_mes"));
            float monto = Float.parseFloat(request.getParameter("monto"));
            String habilitado = request.getParameter("habilitado");
            
            Presupuesto presupuesto = new Presupuesto();
            presupuesto.setId_presupuesto(id);
            presupuesto.setId_deporg(id_deporg);
            presupuesto.setId_mes(id_mes);
            presupuesto.setMonto(monto);
            presupuesto.setHabilitado(habilitado);
            
            
            PresupuestoController controller = new PresupuestoController();
            controller.update(presupuesto);
            
            response.sendRedirect("presupuesto_index.jsp");
            
        
        %>
    </body>
</html>

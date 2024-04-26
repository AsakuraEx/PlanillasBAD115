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
        
            String nombrepuesto, habilitado;
            float salariominimo, salariomaximo;

            int id = Integer.parseInt(request.getParameter("id"));  
            nombrepuesto = request.getParameter("nombrepuesto");
            salariominimo = Float.parseFloat(request.getParameter("salariominimo"));
            salariomaximo = Float.parseFloat(request.getParameter("salariomaximo"));
            int id_unidadorg = Integer.parseInt(request.getParameter("id_unidadorg"));     
            habilitado = request.getParameter("habilitado");
            
            Puesto puesto = new Puesto();
            puesto.setId_puesto(id);
            puesto.setNombrepuesto(nombrepuesto);
            puesto.setSalariominimo(salariominimo);
            puesto.setSalariomaximo(salariomaximo);
            puesto.setId_unidadorg(id_unidadorg);
            puesto.setHabilitado(habilitado);
            
            
            PuestoController controller = new PuestoController();
            controller.update(puesto);
            
            response.sendRedirect("puesto_index.jsp");
            
        
        %>
    </body>
</html>

<%-- 
    Document   : unidadorganizativa_update
    Created on : 23 abr 2024, 5:37:59 p.m.
    Author     : frane
--%>

<%@page import="Controllers.DescuentoController"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String habilitado;

            int ID_DESCUENTO = Integer.parseInt(request.getParameter("ID_DESCUENTO"));
            int id = Integer.parseInt(request.getParameter("id"));
            float DESCUENTO = Float.parseFloat(request.getParameter("DESCUENTO"));         
            habilitado = request.getParameter("habilitado");
            int id_tipodescuento = Integer.parseInt(request.getParameter("id_tipodescuento"));
            LocalDate FECHADESCUENTO = LocalDate.parse(request.getParameter("FECHADESCUENTO"));
            
            
            Descuento descu = new Descuento();
            descu.setID_DESCUENTO(ID_DESCUENTO);
            descu.setDESCUENTO(DESCUENTO);
            descu.setID_EMPLEADO(id);
            descu.setHabilitado(habilitado);    
            descu.setID_TIPODESCUENTO(id_tipodescuento);
            descu.setFECHADESCUENTO(FECHADESCUENTO);
            
            DescuentoController controller = new DescuentoController();
            controller.update(descu);

            Empleado em =new Empleado();
            EmpleadoController cont =new EmpleadoController();
            em=cont.search(id);

            request.setAttribute("id",em.getId_empleado()); // Cambia 123 al número que desees devolver

            request.getRequestDispatcher("descuento2_index.jsp").forward(request, response);

        %>

    </body>
</html>

<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="Models.TipoDescuento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            String nombre, habilitado;

            int id = Integer.parseInt(request.getParameter("id"));           
            nombre = request.getParameter("nombretipodesc");
            String descuentoLey = request.getParameter("descuentoLey"); 
            String descuentoPatronal = request.getParameter("descuentoPatronal");
            String porcentajeStr = request.getParameter("porcentaje");
            float porcentaje = 0.0f; // Valor predeterminado en caso de que no se pueda convertir a float

            if (porcentajeStr != null && !porcentajeStr.isEmpty()) {
                porcentaje = Float.parseFloat(porcentajeStr);
            }
                            
            habilitado = request.getParameter("habilitado");
            
            TipoDescuento tipodescuento = new TipoDescuento();
            tipodescuento.setId_tipodescuento(id);
            tipodescuento.setNombretipodesc(nombre);
            tipodescuento.setDescuentoLey(descuentoLey);
            tipodescuento.setDescuentoPatronal(descuentoPatronal);
            tipodescuento.setPorcentaje(porcentaje);
            tipodescuento.setHabilitado(habilitado);
            
            
            TipoDescuentoController controller = new TipoDescuentoController();
            controller.update(tipodescuento);
            
            response.sendRedirect("tipodescuento_index.jsp");
   
        %>
    </body>
</html>

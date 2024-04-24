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
            habilitado = request.getParameter("habilitado");
            
            TipoDescuento tipodescuento = new TipoDescuento();
            tipodescuento.setId_tipodescuento(id);
            tipodescuento.setNombretipodesc(nombre);
            tipodescuento.setHabilitado(habilitado);
            
            
            TipoDescuentoController controller = new TipoDescuentoController();
            controller.update(tipodescuento);
            
            response.sendRedirect("tipodescuento_index.jsp");
            
        
        %>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoDescuentoController"  %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear tipo de descuento</title>
    </head>
    <body>
       <% 
            //Obtener informacion del formulario
           String nombre = request.getParameter("nombretipodesc");
           String habilitado = request.getParameter("habilitado");

           //Crear instancia del controlador y llamar al metodo create para guardar la informacion
           TipoDescuentoController controller = new TipoDescuentoController();
           controller.create(nombre, habilitado);
           
            response.sendRedirect("tipodescuento_index.jsp");

        %>
        
    </body>
</html>


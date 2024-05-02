
<%@page import="Controllers.DocumentoController"%>
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
            int id_tipodocumento = Integer.parseInt(request.getParameter("id_tipodocumento"));
            String ndocumento = request.getParameter("ndocumento");
            String habilitado = request.getParameter("habilitado");
            
            //Crear el registro en la base de datos
            DocumentoController controller = new DocumentoController();
            controller.create(id_empleado, id_tipodocumento, ndocumento, habilitado);
            
            response.sendRedirect("documento_index.jsp");
        %>
    </body>
</html>

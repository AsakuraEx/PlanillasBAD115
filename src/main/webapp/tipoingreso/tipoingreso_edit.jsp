<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

<%@page import="Models.TipoIngreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoIngresoController"  %>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    TipoIngresoController controller = new TipoIngresoController();
    TipoIngreso tipoingreso = controller.search(id);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tipo de Ingreso</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="../index.jsp">Inicio</a></li>
                    <li><a href="tipoingreso_index.jsp">Tipos de ingresos</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        

        <h3>Formulario de Edicion de los Tipos de Ingresos</h3>
        <br>
        <form action="tipoingreso_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= tipoingreso.getId_tipoingreso() %>"
            
            <label>Nombre del Tipo de Ingreso:</label>
            <input type="text" name="nombretipoingreso" value="<%= tipoingreso.getNombretipoingreso() %>" required>
            
            <label>Estado:</label>
            <input type="" name="habilitado" value="<%= tipoingreso.getHabilitado() %>">
            
            
            <button type="submit">Actualizar</button>
        </form>        
        
    </body>
</html>

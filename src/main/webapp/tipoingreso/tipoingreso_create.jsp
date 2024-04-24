<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoIngresoController"  %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Crear Tipo de Ingreso</title>
</head>
<body>
    <header>
        <h1>Sistema de Gestión de Ingresos</h1>
        <h2>Menú:</h2>
        <nav>
            <ul>
                <li><a href="../index.jsp">Inicio</a></li>
                <li><a href="tipoingreso_index.jsp">Tipos de Ingreso</a></li>
            </ul>
        </nav>
        <hr>
    </header>
    
    <h3>Formulario de Creación de Tipo de Ingreso</h3>
    <br>
    <form action="tipoingreso_store.jsp" method="post">
        <label>Nombre del Tipo de Ingreso:</label>
        <input type="text" name="nombretipoingreso" required>
        
        <label>Habilitado:</label>
        <select name="habilitado">
            <option value="1">Sí</option>
            <option value="0">No</option>
        </select>
        
        <button type="submit">Guardar</button>
    </form>        
    
</body>
</html>

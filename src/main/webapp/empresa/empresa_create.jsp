<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.EmpresaController"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Empresa</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="../index.jsp">Inicio</a></li>
                    <li><a href="empresa_index.jsp">Empresas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        

        <h3>Formulario de Creacion de Empresa</h3>
        <br>
        <form action="empresa_store.jsp" method="post">
            <label>Nombre de Empresa:</label>
            <input type="text" name="nombreempresa" required>
            
            <label>Correo:</label>
            <input type="email" name="correoempresa">

            <label>Direccion:</label>
            <input type="text" name="direccion">
            
            <label>NIC:</label>
            <input type="text" name="nic">
            
            <label>NIT:</label>
            <input type="text" name="nit" pattern="\d{4}-\d{6}-\d{3}-\d{1}" placeholder="####-######-###-#">
            
            <label>Telefono:</label>
            <input type="text" name="telefono" pattern="\d{4}-\d{4}" placeholder="####-####">
            
            <label>Pagina Web:</label>
            <input type="text" name="paginaweb">
            
            <button type="submit">Guardar</button>
        </form>        
        
    </body>
</html>

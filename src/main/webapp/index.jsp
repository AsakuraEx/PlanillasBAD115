<%-- 
    Document   : index
    Created on : 25 mar 2024, 10:40:54 p.m.
    Author     : frane
--%>

<%@page import="Controllers.SexoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="empresa/empresa_index.jsp">Empresas</a></li>

                    <li><a href="unidadorganizativa/unidadorganizativa_index.jsp">Unidades Organizativas</a></li>

                    <li><a href="tipoingreso/tipoingreso_index.jsp">Tipoingreso</a></li>
                    <li><a href="tipodescuento/tipodescuento_index.jsp">Tipos de descuentos</a></li>
                    <li><a href="puesto/puesto_index.jsp">Puestos</a></li>

                </ul>
            </nav>
            <hr>
        </header>
       
    </body>
</html>

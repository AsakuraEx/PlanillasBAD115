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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>BIENVENIDO A TU SISTEMA DE PLANILLAS SIP</h1>
        
        <%
            
            //DEMOSTRACION: ELIMINAR LAS PLECAS (//) EN LA INSTRUCCION QUE SE DESEA PROBAR
            
            //INSTRUCCION QUE INGRESA UN VALOR EN LA BASE DE DATOS
            String sexo = new SexoController().createSexo("Femenino");
            
            //INSTRUCCION QUE ELIMINA UN VALOR EN LA BASE DE DATOS
            //String sexo = new SexoController().deleteSexo(1);
            
            //INSTRUCCION QUE ACTUALIZA UN VALOR EN LA BASE DE DATOS
            //String sexo = new SexoController().updateSexo(1, "Masculino");
            
            //INSTRUCCION QUE MUESTRA UN VALOR DE LA BASE DE DATOS (OCUPAR UN FOR O WHILE PARA MOSTRAR LA LISTA)
            String sexo1 = new SexoController().getSexo(1);
            String sexo2 = new SexoController().getSexo(2);
        %>
        <strong><%=sexo%><strong>
        <br>
        <br>
        <h3>Registros de la tabla sexo</h3>
        <%=sexo1%>
        <br>
        <br>
        <%=sexo2%>
        <br>
        <br>
        
    </body>
</html>

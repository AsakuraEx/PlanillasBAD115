<%-- 
    Document   : depuni_create
    Created on : 25 abr 2024, 8:38:43 p. m.
    Author     : Juanjo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Areas de Departamentos</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Crear area del Departamento</h3>
            <br>
            <form action="areauni_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBREAREAUNIDADORG" required>

                <label>Departamento:</label>
                <select name="ID_DEPORG" required>
                    <option value="">Selecciona un Departamento...</option>
                    <% 
                        DepUnidadOrganiController controller = new DepUnidadOrganiController();
                        List<DepUnidadOrgani> depas = controller.mostrarUnidades1();
                        
                        for(DepUnidadOrgani depa : depas){
                            if(depa.getHabilitado() != "1"){
                    %>
                    <option value="<%= depa.getId_deporg()%>"><%= depa.getNombredeporg()%></option>
                    <% 
                            }
                        }
                    %>
                </select>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>

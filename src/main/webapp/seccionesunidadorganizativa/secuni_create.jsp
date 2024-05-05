<%-- 
    Document   : depuni_create
    Created on : 25 abr 2024, 8:38:43 p. m.
    Author     : Juanjo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.AreaUnidadOrgani"%>
<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secciones de Areas</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="secuni_index.jsp">Secciones de Areas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Registro de Secciones</h3>
            <br>
            <form action="secuni_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBRESECCIONUNIORG" required>

                <label>Area:</label>
                <select name="ID_AREAUNIDADORG" required>
                    <option value="">Selecciona una Area...</option>
                    <% 
                        AreaUnidadOrganiController controller = new AreaUnidadOrganiController();
                        List<AreaUnidadOrgani> areas = controller.mostrarAreas();
                        
                        for(AreaUnidadOrgani area : areas){
                            if(area.getHabilitado() != "1"){
                    %>
                    <option value="<%= area.getID_AREAUNIDADORG()%>"><%= area.getNOMBREAREAUNIDADORG()%></option>
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

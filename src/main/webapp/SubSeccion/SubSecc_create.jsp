<%-- 
    Document   : depuni_create
    Created on : 25 abr 2024, 8:38:43 p. m.
    Author     : Juanjo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subsecciones</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="SubSecc_index.jsp">Subsecciones</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Creacion de Subsecciones</h3>
            <br>
            <form action="SubSecc_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBRESUBSECUNIORG" required>

                <label>Seccion:</label>
                <select name="ID_SECCIONUNIORG" required>
                    <option value="">Selecciona una Seccion...</option>
                    <% 
                        SeccionesUnidadOrganiController controller = new SeccionesUnidadOrganiController();
                        List<SeccionesUnidadOrgani> Secciones = controller.mostrarSecciones();
                        
                        for(SeccionesUnidadOrgani Seccion : Secciones){
                            if(Seccion.getHabilitado() != "1"){
                    %>
                    <option value="<%= Seccion.getID_SECCIONUNIORG()%>"><%= Seccion.getNOMBRESECCIONUNIORG()%></option>
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

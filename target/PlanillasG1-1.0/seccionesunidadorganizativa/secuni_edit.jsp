<%-- 
    Document   : depuni_edit
    Created on : 25 abr 2024, 8:39:04 p. m.
    Author     : Juanjo
--%>

<%@page import="Models.AreaUnidadOrgani"%>
<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page import="java.util.List"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    SeccionesUnidadOrganiController controller = new SeccionesUnidadOrganiController();
    SeccionesUnidadOrgani seccion = controller.search(id);
%>

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
                    <li><a href="../depunidadorganizativa/depuni_index.jsp"> Secciones de Areas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Secciones de Areas</h3>
            <br>
            <form action="secuni_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBRESECCIONUNIORG" value="<%=seccion.getNOMBRESECCIONUNIORG()%>" required>
                <input type="hidden" name="id" value="<%= seccion.getID_SECCIONUNIORG() %>">

                <label>Unidad:</label>
                <select name="ID_AREAUNIDADORG" required>
                    <option value="">Selecciona una empresa...</option>
                    <%                         
                        AreaUnidadOrganiController controllerSeccion = new AreaUnidadOrganiController();
                        List<AreaUnidadOrgani> areas = controllerSeccion.mostrarAreas();
                        
                        for(AreaUnidadOrgani area : areas){
                            if(Integer.parseInt(area.getHabilitado()) == 1){
                    %>
                    <% String selected = (area.getID_AREAUNIDADORG() == seccion.getID_AREAUNIDADORG())? "selected" : " ";  %>
                    <option value="<%= area.getID_AREAUNIDADORG()%>" <%=selected %>><%= area.getNOMBREAREAUNIDADORG()%></option>
                    <%  
                            }
                        }
                    %>
                </select>
                <% 
                    String checked;
                    if(Integer.parseInt(seccion.getHabilitado()) == 1){
                        checked = "checked";
                    }else{
                        checked = " ";
                    } 
                %>
                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1" <%=checked %>>
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>


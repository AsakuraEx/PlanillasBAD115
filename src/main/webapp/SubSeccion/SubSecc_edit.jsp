<%-- 
    Document   : depuni_edit
    Created on : 25 abr 2024, 8:39:04 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page import="java.util.List"%>
<%@page import="Models.SubSeccionesUnidadOrgani"%>
<%@page import="Controllers.SubSeccionesUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    SubSeccionesUnidadOrganiController controller = new SubSeccionesUnidadOrganiController();
    SubSeccionesUnidadOrgani subseccion = controller.search(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Departamentos de Unidades Organizativas</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="../depunidadorganizativa/depuni_index.jsp"> Departamentos de Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Editar departamento para unidad organizativa</h3>
            <br>
            <form action="SubSecc_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBRESUBSECUNIORG" value="<%=subseccion.getNOMBRESUBSECUNIORG()%>" required>
                <input type="hidden" name="id" value="<%= subseccion.getID_SUBSECUNIORG() %>">

                <label>Unidad:</label>
                <select name="ID_SECCIONUNIORG" required>
                    <option value="">Selecciona una Seccion...</option>
                    <%                         
                        SeccionesUnidadOrganiController controllerSub = new SeccionesUnidadOrganiController();
                        List<SeccionesUnidadOrgani> secciones = controllerSub.mostrarSecciones();
                        
                        for(SeccionesUnidadOrgani seccion : secciones){
                            if(Integer.parseInt(seccion.getHabilitado()) == 1){
                    %>
                    <% String selected = (seccion.getID_SECCIONUNIORG() == subseccion.getID_SECCIONUNIORG())? "selected" : " ";  %>
                    <option value="<%= seccion.getID_SECCIONUNIORG()%>" <%=selected %>><%= seccion.getNOMBRESECCIONUNIORG()%></option>
                    <%  
                            }
                        }
                    %>
                </select>
                <% 
                    String checked;
                    if(Integer.parseInt(subseccion.getHabilitado()) == 1){
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


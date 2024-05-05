<%-- 
    Document   : depuni_edit
    Created on : 25 abr 2024, 8:39:04 p. m.
    Author     : Juanjo
--%>

<%@page import="Models.AreaUnidadOrgani"%>
<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page import="java.util.List"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    AreaUnidadOrganiController controller = new AreaUnidadOrganiController();
    AreaUnidadOrgani unidad = controller.search(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unidades Organizativas</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="../depunidadorganizativa/depuni_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Crear unidad organizativa</h3>
            <br>
            <form action="areauni_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="NOMBREAREAUNIDADORG" value="<%=unidad.getNOMBREAREAUNIDADORG()%>" required>
                <input type="hidden" name="id" value="<%= unidad.getID_AREAUNIDADORG()%>">

                <label>Unidad:</label>
                <select name="ID_DEPORG" required>
                    <option value="">Selecciona un Departamento...</option>
                    <%                         
                        DepUnidadOrganiController controllerDep = new DepUnidadOrganiController();
                        List<DepUnidadOrgani> depas = controllerDep.mostrarUnidades1();
                        
                        for(DepUnidadOrgani depa : depas){
                            if(Integer.parseInt(depa.getHabilitado()) == 1){
                    %>
                    <% String selected = (depa.getId_deporg() == unidad.getID_DEPORG())? "selected" : " ";  %>
                    <option value="<%= depa.getId_deporg()%>" <%=selected %>><%= depa.getNombredeporg()%></option>
                    <%  
                            }
                        }
                    %>
                </select>
                <% 
                    String checked;
                    if(Integer.parseInt(unidad.getHabilitado()) == 1){
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


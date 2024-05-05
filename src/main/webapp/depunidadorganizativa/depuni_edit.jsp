<%-- 
    Document   : depuni_edit
    Created on : 25 abr 2024, 8:39:04 p. m.
    Author     : Juanjo
--%>

<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page import="java.util.List"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DepUnidadOrganiController controller = new DepUnidadOrganiController();
    DepUnidadOrgani unidad = controller.search(id);
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
            <form action="depuni_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombredeporg" value="<%=unidad.getNombredeporg()%>" required>
                <input type="hidden" name="id" value="<%= unidad.getId_deporg() %>">

                <label>Unidad:</label>
                <select name="id_unidadorg" required>
                    <option value="">Selecciona una empresa...</option>
                    <%                         
                        UnidadorgController controllerEmpresa = new UnidadorgController();
                        List<Unidadorganizativa> unidades = controllerEmpresa.mostrarUnidades();
                        
                        for(Unidadorganizativa unidad1 : unidades){
                            if(Integer.parseInt(unidad1.getHabilitado()) == 1){
                    %>
                    <% String selected = (unidad1.getId_unidadorg() == unidad.getId_unidadorg())? "selected" : " ";  %>
                    <option value="<%= unidad1.getId_unidadorg()%>" <%=selected %>><%= unidad1.getNombreunidadorg()%></option>
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


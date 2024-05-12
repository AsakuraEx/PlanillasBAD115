<%-- 
    Document   : unidadorganizativa_create
    Created on : 22 abr 2024, 8:27:13 p.m.
    Author     : frane
--%>

<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page import="java.util.List"%>
<%@page import="Models.Empresa"%>
<%@page import="Controllers.EmpresaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    UnidadorgController controller = new UnidadorgController();
    Unidadorganizativa unidad = controller.search(id);
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
                    <li><a href="../empresa/empresa_index.jsp">Empresas</a></li>
                    <li><a href="unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Crear unidad organizativa</h3>
            <br>
            <form action="unidadorganizativa_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombreunidadorg" value="<%=unidad.getNombreunidadorg() %>" required>
                <input type="hidden" name="id" value="<%=unidad.getId_unidadorg() %>">

                <label>Empresa:</label>
                <select name="id_empresa" required>
                    <option value="">Selecciona una empresa...</option>
                    <%                         
                        EmpresaController controllerEmpresa = new EmpresaController();
                        List<Empresa> empresas = controllerEmpresa.mostrarEmpresas();
                        
                        for(Empresa empresa : empresas){
                            if(Integer.parseInt(empresa.getHabilitado()) == 1){
                    %>
                    <% String selected = (empresa.getId_empresa() == unidad.getId_empresa())? "selected" : " ";  %>
                    <option value="<%= empresa.getId_empresa() %>" <%=selected %>><%= empresa.getNombreempresa() %></option>
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

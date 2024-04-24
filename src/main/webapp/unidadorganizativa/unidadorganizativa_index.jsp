<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Controllers.EmpresaController"%>
<%@page import="Models.Empresa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Unidades Organizativas</h1>
        <br>
        <a href="unidadorganizativa_create.jsp"><button>Crear nueva unidad organizativa</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre de la Unidad Organizativa</td>
                <td>Empresa Asociada</td>
                <td>Habilitado</td>
                <td>Accion</td>
            </thead>
            <%
                EmpresaController controllerEmpresa = new EmpresaController();
                Empresa empresa = new Empresa();

                UnidadorgController controller = new UnidadorgController();
                List<Unidadorganizativa> unidades = controller.mostrarUnidades();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(Unidadorganizativa unidad : unidades){
                %>
                <tr>
                    <td><%=unidad.getNombreunidadorg() %></td>
                    
                    <% 
                        empresa = controllerEmpresa.search(unidad.getId_empresa());
                    %>
                    <td><%= empresa.getNombreempresa()   %></td>
                    
                    <% 
                        if(Integer.parseInt(unidad.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="unidadorganizativa_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= unidad.getId_unidadorg() %>">
                            <input type="submit" value="Editar">
                        </form>                    
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>

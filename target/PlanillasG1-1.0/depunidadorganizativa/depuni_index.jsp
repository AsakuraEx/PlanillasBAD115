<%-- 
    Document   : depuni_index
    Created on : 25 abr 2024, 8:39:15 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
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
                    <li><a href="../unidadorganizativa//unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Departamentos de Unidades Organizativas</h1>
        <br>
        <a href="depuni_create.jsp"><button>Crear nuevo departamento</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre de Departamento de Unidad</td>
                <td>Unidad Asociada</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                UnidadorgController controller1 = new UnidadorgController();
                Unidadorganizativa uni = new Unidadorganizativa();

                DepUnidadOrganiController controller = new DepUnidadOrganiController();
                List<DepUnidadOrgani> unidades = controller.mostrarUnidades1();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(DepUnidadOrgani unidad : unidades){
                %>
                <tr>
                    <td><%=unidad.getNombredeporg()%></td>
                    
                    <% 
                        uni = controller1.search(unidad.getId_unidadorg());
                    %>
                    <td><%= uni.getNombreunidadorg()%></td>
                    
                    <% 
                        if(Integer.parseInt(unidad.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="depuni_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= unidad.getId_deporg() %>">
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

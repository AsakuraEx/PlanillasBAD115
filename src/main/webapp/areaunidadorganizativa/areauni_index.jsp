<%-- 
    Document   : depuni_index
    Created on : 25 abr 2024, 8:39:15 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.AreaUnidadOrganiController"%>
<%@page import="Models.AreaUnidadOrgani"%>
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
        <h1>Areas de Departamentos</h1>
        <br>
        <a href="areauni_create.jsp"><button>Crear nueva Area</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre de Departamento de Unidad</td>
                <td>Departamento Asociado</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                DepUnidadOrganiController controller1 = new DepUnidadOrganiController();
                DepUnidadOrgani uni = new DepUnidadOrgani();

                AreaUnidadOrganiController controller = new AreaUnidadOrganiController();
                List<AreaUnidadOrgani> unidades = controller.mostrarAreas();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(AreaUnidadOrgani unidad : unidades){
                %>
                <tr>
                    <td><%=unidad.getNOMBREAREAUNIDADORG()%></td>
                    
                    <% 
                        uni = controller1.search(unidad.getID_DEPORG());
                    %>
                    <td><%= uni.getNombredeporg()%></td>
                    
                    <% 
                        if(Integer.parseInt(unidad.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="areauni_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= unidad.getID_AREAUNIDADORG()%>">
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

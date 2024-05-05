<%-- 
    Document   : depuni_index
    Created on : 25 abr 2024, 8:39:15 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
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
        <h1>Secciones de Areas</h1>
        <br>
        <a href="secuni_create.jsp"><button>Crear nueva seccion</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre de Seccion</td>
                <td>Area Asociada</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                AreaUnidadOrganiController controller1 = new AreaUnidadOrganiController();
                AreaUnidadOrgani uni = new AreaUnidadOrgani();

                SeccionesUnidadOrganiController controller = new SeccionesUnidadOrganiController();
                List<SeccionesUnidadOrgani> secciones = controller.mostrarSecciones();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(SeccionesUnidadOrgani seccion : secciones){
                %>
                <tr>
                    <td><%=seccion.getNOMBRESECCIONUNIORG()%></td>
                    
                    <% 
                        uni = controller1.search(seccion.getID_AREAUNIDADORG());
                    %>
                    <td><%= uni.getNOMBREAREAUNIDADORG()%></td>
                    
                    <% 
                        if(Integer.parseInt(seccion.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="secuni_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= seccion.getID_SECCIONUNIORG() %>">
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

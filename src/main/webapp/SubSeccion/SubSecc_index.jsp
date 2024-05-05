<%-- 
    Document   : depuni_index
    Created on : 25 abr 2024, 8:39:15 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.SubSeccionesUnidadOrganiController"%>
<%@page import="Models.SubSeccionesUnidadOrgani"%>
<%@page import="Controllers.SeccionesUnidadOrganiController"%>
<%@page import="Models.SeccionesUnidadOrgani"%>
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
        <h1>Subsecciones</h1>
        <br>
        <a href="SubSecc_create.jsp"><button>Crear nueva Subseccion</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre de Subseccion</td>
                <td>Seccion Asociada</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                SeccionesUnidadOrganiController controller1 = new SeccionesUnidadOrganiController();
                SeccionesUnidadOrgani uni = new SeccionesUnidadOrgani();

                SubSeccionesUnidadOrganiController controller = new SubSeccionesUnidadOrganiController();
                List<SubSeccionesUnidadOrgani> SubSecs = controller.mostrarSubSec();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(SubSeccionesUnidadOrgani SubSec : SubSecs){
                %>
                <tr>
                    <td><%=SubSec.getNOMBRESUBSECUNIORG()%></td>
                    
                    <% 
                        uni = controller1.search(SubSec.getID_SECCIONUNIORG());
                    %>
                    <td><%= uni.getNOMBRESECCIONUNIORG()%></td>
                    
                    <% 
                        if(Integer.parseInt(SubSec.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="SubSecc_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= SubSec.getID_SUBSECUNIORG() %>">
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

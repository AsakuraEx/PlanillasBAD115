<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Controllers.ProfesionController"%>
<%@page import="Models.Profesion"%>
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
                    <li><a href="../index.jsp">Inicio</a></li>
                    <li><a href="../empresa/empresa_index.jsp">Empresas</a></li>
                    <li><a href="../unidadorganizativa/unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                    <li><a href="profesion/profesion_index.jsp">Profesiones</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Profesiones</h1>
        <br>
        <a href="profesion_create.jsp"><button>Crear nueva Profesion</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Profesion</td>
                <td>Habilitado</td>
                <td>Accion</td>
            </thead>
            <%
                ProfesionController controller = new ProfesionController();
                List<Profesion> profesiones = controller.mostrarProfesiones();   

                String mensaje;
            %>
            <tbody>
                <%
                    for(Profesion profesion : profesiones){
                %>
                <tr>
                    <td><%=profesion.getNombreprofesion() %></td>
                    <% 
                        if(Integer.parseInt(profesion.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="profesion_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= profesion.getId_profesion()%>">
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

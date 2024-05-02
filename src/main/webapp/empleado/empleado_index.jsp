<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Models.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.EmpleadoController"%>
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
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Empleados</h1>
        <br>
        <a href="empleado_create.jsp"><button>Crear nuevo empleado</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre</td>
                <td>Fecha de Nacimiento</td>
                <td>Fecha de Ingreso</td>                
                <td>Salario</td>
                <td>Correo Personal</td>
                <td>Correo Institucional</td>
                <td>Habilitado</td>
                <td>Accion</td>
            </thead>
            <%
                EmpleadoController controllerEmpleado = new EmpleadoController();
                List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();   
                
                DocumentoController controllerdoc = new DocumentoController();
                Lis<>
            %>
            <tbody>
                <%
                    for(Empleado empleado : empleados){
                %>
                <tr>
                    <td>
                        <%=empleado.getPrimernombre() %> 
                        <%
                            if(empleado.getSegundonombre() != null){
                        %>
                                <%=empleado.getSegundonombre()%>
                        <%
                            }
                        %> 
                        <%=empleado.getPrimerapellido() %> 
                        <%
                            if(empleado.getSegundoapellido() != null){
                        %>
                                <%=empleado.getSegundoapellido()%>
                        <%
                            }
                        %> 
                        <%
                            if(empleado.getApellidocasada() != null){
                        %>
                                <%=empleado.getApellidocasada()%>
                        <%
                            }
                        %>
                    </td>
                    <td><%= empleado.getFechanacimiento()  %></td>
                    <td><%= empleado.getFechaingresosistema()  %></td>
                    <td>$ <%= empleado.getSalario()  %></td>
                    <td><%= empleado.getCorreopersonal()  %></td>
                    <td><%= empleado.getCorreoinstitucional()  %></td>
                    <td>
                        <%
                            if(Integer.parseInt(empleado.getHabilitado())== 1){
                        %>
                            Habilitado
                        <%
                            }else{
                        %>
                            Deshabilitado
                        <%
                            }
                        %>
                    </td>                    
                    <td style="display: flex; align-content: center; align-items: center; justify-content: center;">
                        <form action="empleado_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= empleado.getId_empleado() %>">
                            <input type="submit" value="Editar">
                        </form>
                        <form action="empleado_delete.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= empleado.getId_empleado() %>">
                            <input type="hidden" name="habilitado" value="0">
                            <input type="submit" value="Borrar">
                        </form>  
                            
                            foreach id_empleado=id_documento 
                            
                        <form action="empleado_show.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= empleado.getId_empleado() %>">
                            <input type="hidden" name="id_documento" value="<%= empleado.getId_empleado() %>">
                            <input type="submit" value="Detalle">
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

<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.DescuentoController"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="Models.TipoDescuento"%>
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
                    <li><a href="index.jsp/../..">Index</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Total de descuentos por empleados</h1>

        <table border="1">
            <thead>
                <td>Empleado</td>
                <td>Salario</td>
                <td>Descuentos totales</td>
                <td>Accion</td>
            </thead>
            <%
                EmpleadoController controllerEmpleado = new EmpleadoController();
                List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();       
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

                    <td><%= empleado.getSalario()%></td>
                     <%
                        EmpleadoController controllerEmpleado1 = new EmpleadoController();
                        double descuentosTotales = controllerEmpleado1.sumarDescuentosEmpleado(empleado.getId_empleado());  
                     %>
                    
                    <td><%= String.format("%.2f", descuentosTotales)%></td>
                    <td>
                        <form action="descuento2_index.jsp" method="POST">
                            <input type="hidden" name="id" value="<%=empleado.getId_empleado()%>">
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

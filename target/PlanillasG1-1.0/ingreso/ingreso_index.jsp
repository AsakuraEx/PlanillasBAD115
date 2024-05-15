<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.TipoIngreso"%>
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
        <h1>Total de ingresos por empleados</h1>

        <table border="1">
            <thead>
                <td>Empleado</td>
                <td>Salario</td>
                <td>Ingresos totales</td>
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

                    <td>$ <%= empleado.getSalario()%></td>

                     <%
                        EmpleadoController controllerEmp = new EmpleadoController();
                        double totalIng = controllerEmp.sumarIngresosEmpleado(empleado.getId_empleado());
                     %>
                    
                    <td>$ <%= totalIng%></td>
                    
                    <td>
                        <form action="ingreso_empleado.jsp" method="POST">
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

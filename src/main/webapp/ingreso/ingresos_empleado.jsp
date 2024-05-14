<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%      
        int id = Integer.parseInt(request.getParameter("id"));
        Empleado empleado =new Empleado();
        EmpleadoController empleadoController = new EmpleadoController();
        empleado = empleadoController.search(id);   
    %>

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
                    <li><a href="ingreso_index.jsp">Atrás</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Detalle de ingresos de: </h1>
        <h2>
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
        </h2>
        
        <br>
        <a href="ingreso_create.jsp"><button>Agregar nuevo ingreso</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Tipo de ingreso</td>
                <td>Monto</td>
                <td>Estado</td>
                <td>Acciones</td>
            </thead>
            <%
                TipoIngresoController controllerTipo = new TipoIngresoController();
                TipoIngreso tipoIng= new TipoIngreso();
                String mensaje;
            %>
            <tbody>
                <%      
                IngresoController ingEmpleado = new IngresoController();
                List<Ingreso> ingresos = ingEmpleado.mostrarIngresosPorEmpleado(empleado.getId_empleado());

                    for(Ingreso ing : ingresos){
                %>
                <tr>                    
                    <% 
                        tipoIng=controllerTipo.search(ing.getId_tipoingreso());
                    %>
                    <td><%= tipoIng.getNombretipoingreso() %></td>                    
                    <td><%=ing.getIngreso() %></td>
                    <% 
                        if(Integer.parseInt(ing.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="ingreso_editar.jsp" method="POST">
                            <input type="hidden" name="idIng" value="<%= ing.getId_ingreso() %>">
                            <input type="hidden" name="idEmp" value="<%= ing.getId_empleado() %>">
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

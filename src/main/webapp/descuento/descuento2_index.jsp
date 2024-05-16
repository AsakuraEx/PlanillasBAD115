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
                    <li><a href="descuento_index.jsp">Atrás</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Detalle de descuentos de: </h1>
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
        <!-- Enviar el id del empleado a la vista descuento_create -->
        <a href="descuento_create.jsp?id_empleado=<%= empleado.getId_empleado() %>"><button>Agregar nuevo descuento</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Tipo descuento</td>
                <td>Monto</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                TipoDescuentoController controllerTipo = new TipoDescuentoController();
                TipoDescuento tipo1= new TipoDescuento();
                String mensaje;
            %>
            <tbody>
                <%      
                    DescuentoController descuentosPorEmpleado = new DescuentoController();
                    List<Descuento> Descuentosp = descuentosPorEmpleado.mostrarDescuentosPorEmpleado(empleado.getId_empleado());

                        for(Descuento des : Descuentosp){
                %>
                <tr>                    
                    <% 
                        tipo1=controllerTipo.search(des.getId_tipodescuento());
                    %>
                    <td><%= tipo1.getNombretipodesc()%></td>                    
                    <td><%=des.getDescuento() %></td>
                    <% 
                        if(Integer.parseInt(des.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="descuento_edit.jsp" method="POST">
                            <input type="hidden" name="id_descuento" value="<%= des.getId_descuento() %>">
                            <input type="hidden" name="id_empleado" value="<%= des.getId_empleado() %>">
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

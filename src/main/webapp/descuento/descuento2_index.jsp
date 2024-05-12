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
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="../empresa/empresa_index.jsp">Empresas</a></li>
                    <li><a href="unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        <h1>Unidades Organizativas</h1>
        <br>
        <a href="unidadorganizativa_create.jsp"><button>Crear nueva unidad organizativa</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Tipo descuento</td>
                <td>Monto</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                //EmpleadoController controllerEmpleado = new EmpleadoController();
                
                //Empleado empleado = new Empleado();

                TipoDescuentoController controllerTipo = new TipoDescuentoController();
                TipoDescuento tipo1= new TipoDescuento();
                String mensaje;
            %>
            <tbody>
                <%
                    
                int id = Integer.parseInt(request.getParameter("id"));
                DescuentoController descuentosPorEmpleado = new DescuentoController();
                List<Descuento> Descuentosp = descuentosPorEmpleado.mostrarDescuentosPorEmpleado(id);

                    for(Descuento des : Descuentosp){
                %>
                <tr>                    
                    <% 
                        tipo1=controllerTipo.search(des.getID_TIPODESCUENTO());
                    %>
                    <td><%= tipo1.getNombretipodesc()%> %></td>                    
                    <td><%=des.getDESCUENTO() %>></td>
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
                            <input type="hidden" name="id" value="<%= des.getID_DESCUENTO() %>">
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

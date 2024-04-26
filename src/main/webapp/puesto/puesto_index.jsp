<%@page import="Controllers.UnidadorgController"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.PuestoController"%>
<%@page import="Models.Puesto"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
        <h1>Puestos</h1>
        <br>
        <a href="puesto_create.jsp"><button>Crear nuevo puesto</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Nombre del puesto</td>
                <td>Unidad asociada</td>
                <td>Salario mínimo</td>
                <td>Salario máximo</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                UnidadorgController controllerUnidad = new UnidadorgController();
                Unidadorganizativa unidad = new Unidadorganizativa();

                PuestoController controller = new PuestoController();
                List<Puesto> puestos = controller.mostrarPuestos();

                String mensaje;
            %>
            <tbody>
                <%
                    for(Puesto puesto : puestos){
                %>
                <tr>
                    <td><%=puesto.getNombrepuesto() %></td>
                    
                    <% 
                        unidad = controllerUnidad.search(puesto.getId_unidadorg());
                    %>
                    <td><%= unidad.getNombreunidadorg()  %></td>
                    <%
                        NumberFormat formatoDolar = NumberFormat.getCurrencyInstance(Locale.US);
                     %>
                    <td><%= formatoDolar.format (puesto.getSalariominimo())  %></td>
                    <td><%= formatoDolar.format (puesto.getSalariomaximo()) %></td>
                     <% 
                        if(Integer.parseInt(puesto.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    
                    <td>
                        <form action="puesto_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= puesto.getId_puesto() %>">
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

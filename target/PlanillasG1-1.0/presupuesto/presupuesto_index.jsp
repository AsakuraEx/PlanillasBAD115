<%@page import="Controllers.MesController"%>
<%@page import="Models.Mes"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.PresupuestoController"%>
<%@page import="Models.Presupuesto"%>
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
        <h1>Presupuestos por Departamentos Organizativos</h1>
        <br>
        <a href="presupuesto_create.jsp"><button>Crear nuevo presupuesto</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Departamento de unidad organizativa</td>
                <td>Mes</td>
                <td>Monto asignado</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                DepUnidadOrganiController controllerdep = new DepUnidadOrganiController();
                DepUnidadOrgani depunidad = new DepUnidadOrgani();
                
                MesController controllermes = new MesController();
                Mes mes = new Mes();

                PresupuestoController controller = new PresupuestoController();
                List<Presupuesto> presupuestos = controller.mostrarPresupuestos();

                String mensaje;
            %>
            <tbody>
                <%
                    for(Presupuesto presupuesto : presupuestos){
                %>
                <tr>
                    <% 
                        depunidad = controllerdep.search(presupuesto.getId_deporg());
                    %>
                    <td><%= depunidad.getNombredeporg() %></td>
                    
                    <% 
                        mes = controllermes.search(presupuesto.getId_mes());
                    %>
                    <td><%= mes.getMes() %></td>
                    
                    <td> $ <%=presupuesto.getMonto() %></td>
                    
                     <% 
                        if(Integer.parseInt(presupuesto.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    
                    <td>
                        <form action="presupuesto_edit.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= presupuesto.getId_presupuesto() %>">
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

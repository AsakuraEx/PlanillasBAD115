<%@page import="java.util.List"%>
<%@page import="Controllers.MesController"%>
<%@page import="Models.Mes"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.PresupuestoController"%>
<%@page import="Models.Presupuesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    PresupuestoController controllerpres = new PresupuestoController();
    Presupuesto presupuesto = controllerpres.search(id);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>
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
        
        <main>
            <h3>Asignar presupuesto a Departamento Organizativo</h3>
            <br>
            <form action="presupuesto_update.jsp" method="post">
                <input type="hidden" name="id" value="<%=presupuesto.getId_presupuesto() %>">
                <select name="id_deporg" required>
                    <option value="">Selecciona un departamento organizativo...</option>
                    <% 
                        DepUnidadOrganiController controller = new DepUnidadOrganiController();
                        List<DepUnidadOrgani> depunidades = controller.mostrarUnidades1();
                        
                        for(DepUnidadOrgani unidad : depunidades){
                            if(Integer.parseInt(unidad.getHabilitado()) == 1){
                    %>
                    <% String selected = (unidad.getId_deporg() == presupuesto.getId_deporg())? "selected" : " ";  %>
                    <option value="<%= unidad.getId_deporg() %>"<%=selected %>><%= unidad.getNombredeporg() %></option>
                    <% 
                            }
                        }
                    %>
                </select>
                <select name="id_mes" required>
                    <option value="">Selecciona el mes correspondiente para el presupuesto...</option>
                    <% 
                        MesController controllermes = new MesController();
                        List<Mes> meses = controllermes.mostrarMes();
                        
                        for(Mes mes : meses){    
                    %>
                    <% String selected = (mes.getId_mes() == presupuesto.getId_mes())? "selected" : " ";  %>
                    <option value="<%= mes.getId_mes() %>"<%=selected %>><%= mes.getMes() %></option>
                    <%  
                        }
                    %>
                </select>
                <label>Presupuesto a asignar al mes seleccionado</label>
                <input type="text" id="monto" name="monto" value="<%=presupuesto.getMonto()%>" required>
                <% 
                    String checked;
                    if(Integer.parseInt(presupuesto.getHabilitado()) == 1){
                        checked = "checked";
                    }else{
                        checked = " ";
                    } 
                %>
                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1" <%=checked %>>
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>



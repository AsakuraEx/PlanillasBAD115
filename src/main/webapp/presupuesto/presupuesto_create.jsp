<%@page import="java.util.List"%>
<%@page import="Controllers.MesController"%>
<%@page import="Models.Mes"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <form action="presupuesto_store.jsp" method="post">
                <select name="id_deporg" required>
                    <option value="">Selecciona un departamento organizativo...</option>
                    <% 
                        DepUnidadOrganiController controller = new DepUnidadOrganiController();
                        List<DepUnidadOrgani> depunidades = controller.mostrarUnidades1();
                        
                        for(DepUnidadOrgani unidad : depunidades){
                            if(Integer.parseInt(unidad.getHabilitado()) == 1){
                    %>
                    <option value="<%= unidad.getId_deporg() %>"><%= unidad.getNombredeporg() %></option>
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
                    <option value="<%= mes.getId_mes() %>"><%= mes.getMes() %></option>
                    <%  
                        }
                    %>
                </select>
                <label>Presupuesto a asignar al mes seleccionado</label>
                <input type="text" id="monto" name="monto" placeholder="$ 0.00 " required>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>



<%@page import="Models.Empleado"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
    int id_ingreso = Integer.parseInt(request.getParameter("id_ingreso"));
    
    IngresoController controller = new IngresoController();
    Ingreso ing = controller.search(id_ingreso);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresos</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="ingreso_index.jsp">Resumen de total de ingresos</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Editar ingreso de empleado</h3>
            <br>

            <form action="ingreso_update.jsp" method="post">
                <!-- Enviar el id del ingreso y del empleado a editar, para que lo procese la vista update -->
                <input type="hidden" name="id_empleado" value="<%= id_empleado %>">
                <input type="hidden" name="id_ingreso" value="<%= id_ingreso %>">
                <input type="hidden" name="fechaingreso" value="<%=ing.getFechaingreso() %>">

                
                <label>Tipo de ingreso:</label>
                <select name="id_tipoingreso" required>
                    <option value="">Seleccione un tipo de ingreso...</option>
                    <%                         
                        TipoIngresoController controllerTipo = new TipoIngresoController();
                        List<TipoIngreso> tipoIng = controllerTipo.mostrarTipoIngreso();
                        
                        for(TipoIngreso tipo : tipoIng){
                            if(Integer.parseInt(tipo.getHabilitado()) == 1){
                    %>
                    <% String selected = (tipo.getId_tipoingreso() == ing.getId_tipoingreso())? "selected" : " ";  %>
                    <option value="<%= tipo.getId_tipoingreso() %>" <%=selected %>><%= tipo.getNombretipoingreso() %></option>
                    <%  
                            }
                        }
                    %>
                </select>
                
                <label>Monto($):</label>
                <input type="text" name="ingreso" value="<%=ing.getIngreso() %>" pattern="^\d+(\.\d{1,2})?$" required>
                
                <% 
                    String checked;
                    if(Integer.parseInt(ing.getHabilitado()) == 1){
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


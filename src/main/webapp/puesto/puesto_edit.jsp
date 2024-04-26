<%@page import="Models.Puesto"%>
<%@page import="Controllers.PuestoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    PuestoController controller = new PuestoController();
    Puesto puesto = controller.search(id);
%>

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
            <h3>Editar puesto</h3>
            <br>
            <form action="puesto_update.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombrepuesto" value="<%=puesto.getNombrepuesto() %>" required>
                <input type="hidden" name="id" value="<%=puesto.getId_puesto() %>">

                <label>Salario mínimo</label>
                <input type="text" name="salariominimo" value="<%=puesto.getSalariominimo() %>" required>
                
                <label>Salario máximo</label>
                <input type="text" name="salariomaximo" value="<%=puesto.getSalariomaximo() %>" required>
                
                <label>Unidad Organizativa:</label>
                <select name="id_unidadorg" required>
                    <option value="">Selecciona una empresa...</option>
                    <%                         
                        UnidadorgController controllerUnidadorganizativa = new UnidadorgController();
                        List<Unidadorganizativa> unidades = controllerUnidadorganizativa.mostrarUnidades();
                        
                        for(Unidadorganizativa unidad : unidades){
                            if(Integer.parseInt(unidad.getHabilitado()) == 1){
                    %>
                    <% String selected = (unidad.getId_unidadorg() == puesto.getId_unidadorg())? "selected" : " ";  %>
                    <option value="<%= unidad.getId_unidadorg() %>" <%=selected %>><%= unidad.getNombreunidadorg() %></option>
                    <%  
                            }
                        }
                    %>
                </select>
                <% 
                    String checked;
                    if(Integer.parseInt(puesto.getHabilitado()) == 1){
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


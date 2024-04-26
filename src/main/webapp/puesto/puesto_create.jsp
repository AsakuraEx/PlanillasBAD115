<%@page import="java.util.List"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
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
            <h3>Crear puesto</h3>
            <br>
            <form action="puesto_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombrepuesto" required>
                
                <label>Salario mínimo</label>
                <input type="text" name="salariominimo" required>
                
                <label>Salario máximo</label>
                <input type="text" name="salariomaximo" required>
                
                <label>Unidad organizativa:</label>
                <select name="id_unidadorg" required>
                    <option value="">Selecciona una unidad organizativa...</option>
                    <% 
                        UnidadorgController controller = new UnidadorgController();
                        List<Unidadorganizativa> unidades = controller.mostrarUnidades();
                        
                        for(Unidadorganizativa unidad : unidades){
                            if(Integer.parseInt(unidad.getHabilitado()) == 1){
                    %>
                    <option value="<%= unidad.getId_unidadorg() %>"><%= unidad.getNombreunidadorg() %></option>
                    <% 
                            }
                        }
                    %>
                </select>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>

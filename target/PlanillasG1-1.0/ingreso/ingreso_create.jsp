<%@page import="Models.Empleado"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresos por empleado</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="ingresos_empleado.jsp">Atrás</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Agregar ingreso a empleado</h3>
            <br>
            <form action="ingreso_store.jsp" method="post">
                <%
                    EmpleadoController controllerEmp = new EmpleadoController();
                    Empleado emp = new Empleado();
                    Empleado empleado = controllerEmp.search(emp.getId_empleado()); 
                %>
                <label>Nombre:</label>
                <input type="text" name="nombrepuesto" value="<%=puesto.getNombrepuesto() %>" required>
                <input type="hidden" name="id" value="<%=puesto.getId_puesto() %>">
                

                
                <label>Tipo de ingreso:</label>
                <select name="id_tipoingreso" required>
                    <option value="">Selecciona un tipo de ingreso...</option>
                    <% 
                        TipoIngresoController controller = new TipoIngresoController();
                        List<TipoIngreso> tipos = controller.mostrarTipoIngreso();
                        
                        for(TipoIngreso tipo : tipos){
                            if(Integer.parseInt(tipo.getHabilitado()) == 1){
                    %>
                    <option value="<%= tipo.getId_tipoingreso() %>"><%= tipo.getNombretipoingreso() %></option>
                    <% 
                            }
                        }
                    %>
                </select>
                
                <label>Monto($):</label>
                <input type="text" name="ingreso" oninput="validarMonto(this)" required>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>
<script>
    function validarMonto(input) {
        // Expresión regular para verificar si el valor es un número con decimales
        var regex = /^\d*\.?\d*$/;
        if (!regex.test(input.value)) {
            alert("Por favor, introduce un número válido.");
            input.value = ''; // Limpiar el campo si no es un número válido
        }
    }
</script>

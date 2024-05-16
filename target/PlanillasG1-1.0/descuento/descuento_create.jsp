<%-- 
    Document   : unidadorganizativa_create
    Created on : 22 abr 2024, 8:27:13 p.m.
    Author     : frane
--%>

<%@page import="Models.TipoDescuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.DescuentoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descuentos por empleado</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="descuneto_index.jsp">Resumen de total de descuentos</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Agregar descuento a empleado</h3>
            <br>
                <%
                    int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
                %>
            <form action="descuento_store.jsp" method="post">
                <!-- Recibe el id del empleado enviado desde la vista descuento2_index, para que lo procese la vista store -->
                <input type="hidden" name="id_empleado" value="<%= id_empleado %>">

                <label>Tipo de descuento:</label>
                <select name="id_tipodescuento" required>
                    <option value="">Selecciona un tipo de descuento...</option>
                    <% 
                        TipoDescuentoController controller = new TipoDescuentoController();
                        List<TipoDescuento> tipos = controller.mostrarTipoDescuento();
                        
                        for(TipoDescuento tipo : tipos){
                            if(Integer.parseInt(tipo.getHabilitado()) == 1){
                    %>
                    <option value="<%= tipo.getId_tipodescuento() %>"><%= tipo.getNombretipodesc() %></option>
                    <% 
                            }
                        }
                    %>
                </select>
                
                <label>Monto($):</label>
                <input type="text" name="descuento" oninput="validarMonto(this)" required>

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

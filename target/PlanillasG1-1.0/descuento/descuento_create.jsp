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
                <%
                    int id_empleado = Integer.parseInt(request.getParameter("id"));
                %>
                <ul>
                     <div class="md:mx-auto flex justify-center py-12">
                        <form action="./descuento2_index.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= id_empleado %>">
                            <button type="submit" class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded">
                                Listado de descuentos
                            </button>
                        </form>
                    </div>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Agregar descuento a empleado</h3>
            <br>

            <form action="descuento_store.jsp" method="post">
                <!-- Recibe el id del empleado enviado desde la vista descuento2_index, para que lo procese la vista store -->
                <input type="hidden" name="id" value="<%= id_empleado %>">

                <label>Tipo de descuento:</label>
                <select name="ID_TIPODESCUENTO" required>
                    <option value="">Selecciona un tipo de descuento...</option>
                    <% 
                        TipoDescuentoController controller = new TipoDescuentoController();
                        List<TipoDescuento> tipos = controller.mostrarTipoDescuentonoley();
                        
                        for(TipoDescuento tipo : tipos){
                            if((Integer.parseInt(tipo.getHabilitado()) == 1 ) && (Integer.parseInt(tipo.getDescuentoLey()) == 0 )) {
                    %>
                    <option value="<%= tipo.getId_tipodescuento() %>"><%= tipo.getNombretipodesc() %></option>
                    <% 
                            }
                        }//oninput="validarMonto(this)" required
                    %>
                </select>
                
                <label>Monto($):</label>
                <input type="text" name="DESCUENTO" required>

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

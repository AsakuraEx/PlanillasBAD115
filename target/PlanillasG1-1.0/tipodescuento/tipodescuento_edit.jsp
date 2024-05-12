<%@page import="Models.TipoDescuento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoDescuentoController"  %>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    TipoDescuentoController controller = new TipoDescuentoController();
    TipoDescuento tipodescuento = controller.search(id);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar tipo de descuento</title>
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
        

        <h3>Formulario de Edicion de tipo de descuento</h3>
        <br>
        <form action="tipodescuento_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento() %>"
            
            <label>Nombre de tipo de descuento:</label>
            <input type="text" name="nombretipodesc" value="<%= tipodescuento.getNombretipodesc() %>" required>
            
            <% 
                String checked1;
                if(Integer.parseInt(tipodescuento.getDescuentoLey()) == 1){
                    checked1 = "checked";
                }else{
                    checked1 = " ";
                } 
            %>

            <label>¿Es descuento de Ley?</label>
            <input type="checkbox" id="descuentoLeyCheckbox" name="descuentoLey" value="1" <%=checked1 %> >
            <input type="hidden" name="descuentoLey" value="0" >

            <label id="descuentoLabel">Monto de descuento:</label>
            <input type="text" id="porcentajeInput" name="porcentaje" value="<%= tipodescuento.getPorcentaje() %>" >
            
            <% 
                String checked;
                if(Integer.parseInt(tipodescuento.getHabilitado()) == 1){
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
        
    </body>
</html>

<script>
    // Obtener el checkbox, el label y el input
    var descuentoLeyCheckbox = document.getElementById("descuentoLeyCheckbox");
    var descuentoLabel = document.getElementById("descuentoLabel");
    var porcentajeInput = document.getElementById("porcentajeInput");

    // Función para mostrar u ocultar el label y el input según el estado del checkbox
    function toggleDescuento() {
        if (descuentoLeyCheckbox.checked) {
            descuentoLabel.style.display = "inline-block";
            porcentajeInput.style.display = "inline-block";
        } else {
            descuentoLabel.style.display = "none";
            porcentajeInput.style.display = "none";
            // Asignar un valor por defecto de 0.0 al input cuando se oculta
            porcentajeInput.value = "0.0";
        }
    }

    // Llamar a la función una vez para establecer el estado inicial
    toggleDescuento();

    // Agregar un listener para detectar cambios en el checkbox
    descuentoLeyCheckbox.addEventListener("change", toggleDescuento);
</script>


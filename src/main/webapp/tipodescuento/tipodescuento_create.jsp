<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear tipo de descuento</title>
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
        

        <h3>Formulario de Creación de Tipo Descuento</h3>
        <br>
        <form action="tipodescuento_store.jsp" method="post">
            <label>Nombre de tipo de descuento:</label>
            <input type="text" name="nombretipodesc" required>
            
            <label for="descuentoLey">¿Es descuento de Ley?</label>
            <input type="checkbox" id="descuentoLeyCheckbox" name="descuentoLey" value="1" onchange="habilitarDescuento()">
            <input type="hidden" name="descuentoLey" value="0">

            <label for="porcentaje">Monto de descuento:</label>
            <input type="text" id="porcentaje" name="porcentaje" required disabled value="0.0">
            
            <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                          
            <button type="submit">Guardar</button>
        </form>     
    </body>
</html>

<script>
    function habilitarDescuento() {
        var checkbox = document.getElementById("descuentoLeyCheckbox");
        var montoInput = document.getElementById("porcentaje");

        if (checkbox.checked) {
            montoInput.disabled = false;
            montoInput.value = ""; // Limpiar el valor por defecto si se habilita el campo
        } else {
            montoInput.disabled = true;
            montoInput.value = "0.0"; // Valor por defecto si no se marca el checkbox
        }
    }
</script>

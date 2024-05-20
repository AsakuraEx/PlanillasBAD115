<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear tipo de descuento</title>
        <link rel="stylesheet" href="../css/output.css">
    </head>
    <body>
        <header class="bg-[#80BF96] shadow-md">

            <div class="container text-center text-white">
        
                    <h1 class="text-2xl font-bold py-4 md:text-3xl ">
                        <a href="../index.jsp">Sistema de Planillas</a>
                    </h1>
    
            </div>  
    
        </header>
        
        <main class="bg-slate-100">
    
            <section class="container bg-white h-[600vh] min-h-full max-h-screen">
    
                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Formulario de creacion de tipos de descuento</h1>
    
                </div>
                <form action="tipodescuento_store.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                    <div class="container text-center py-4 md:col-span-2">
                        <label>Nombre de tipo de descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full text-center" type="text" name="nombretipodesc" required>

                        <label for="descuentoLey">¿Es descuento de Ley?</label>
                        <input type="checkbox" id="descuentoLeyCheckbox" name="descuentoLey" value="1" onchange="habilitarDescuento()">
                        <input type="hidden" name="descuentoLey" value="0">
                    </div>

                    <div class="container text-center py-4 md:col-span-2">
                        <label for="porcentaje" id="labelPorcentaje" style="display: none;">Porcentaje de descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full text-center" type="text" id="porcentaje" name="porcentaje" required disabled value="0.0" pattern="^(0\.[0-9]{1,2}[1-9]|[1-9]\d?(\.\d{1,2})?|100(\.0{1,2})?)$" placeholder="0.01 - 100" style="display: none;">    
                    </div>
                    
                    <div class="container text-center py-4 md:col-span-2">
                        <label for="descuentoPatronal" id="labelPatronal" style="display: none;">¿Es descuento Patronal?</label>
                        <input type="checkbox" id="descuentoPatronalCheckbox" name="descuentoPatronal" value="1" style="display: none;">
                        <input type="hidden" name="descuentoPatronal" value="0">
                    </div>                    
                    
                    <div class="inline-flex px-4 items-center gap-3 mx-auto md:col-span-2">
                        <label>Habilitado:</label>
                        <input type="checkbox" name="habilitado" value="1">
                        <input type="hidden" name="habilitado" value="0">
                    </div>
           
                    <div class="flex flex-col gap-2 px-4 md:col-span-2 md:flex-row md:mx-auto md:my-4">

                            <button class="bg-[#80BF96] hover:bg-[#629c76] py-2 px-4 text-center rounded-md font-bold text-white md:w-32" type="submit">Guardar</button>
                            <button class="font-bold bg-[#f2f2f2] px-4 py-2 rounded-md text-black hover:bg-[#d4d4d4] hover:text-black md:w-32" type="reset">Limpiar</button>
                        
                    </div>
        
                    </form>
        
                    <div class="md:mx-auto flex justify-center py-12">
        
                        <a class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded" href="./tipodescuento_index.jsp">Regresar al listado</a>
        
                    </div>
        
                </section>
            
            </main>      
    </body>
</html>

<script>
function habilitarDescuento() {
    var checkbox = document.getElementById("descuentoLeyCheckbox");
    var montoInput = document.getElementById("porcentaje");
    var labelPorcentaje = document.getElementById("labelPorcentaje");
    var labelPatronal = document.getElementById("labelPatronal");
    var checkbox1 = document.getElementById("descuentoPatronalCheckbox");

    if (checkbox.checked) {
        montoInput.disabled = false;
        montoInput.style.display = "inline-block"; // Mostrar el input
        labelPorcentaje.style.display = "inline-block"; // Mostrar el label
        labelPatronal.style.display = "inline-block";
        checkbox1.style.display = "inline-block";
        montoInput.value = ""; // Limpiar el valor por defecto si se habilita el campo
    } else {
        montoInput.disabled = true;
        montoInput.style.display = "none"; // Ocultar el input
        labelPorcentaje.style.display = "none"; // Ocultar el label
        montoInput.value = "0.0"; // Valor por defecto si no se marca el checkbox
    }
}
</script>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Formulario de actualizacion de tipos de descuento</h1>
    
                </div>
                <form action="tipodescuento_update.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                    <% 
                        String checked1;
                        if(Integer.parseInt(tipodescuento.getDescuentoLey()) == 1){
                            checked1 = "checked";
                        }else{
                            checked1 = " ";
                        } 
                    %>                    
                    <div class="container text-center py-4 md:col-span-2">
                        <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento() %>">
                        <label>Nombre de tipo de descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full text-center" type="text" name="nombretipodesc" value="<%= tipodescuento.getNombretipodesc() %>" required>    
                    
                        <label>¿Es descuento de Ley?</label>
                        <input type="checkbox" id="descuentoLeyCheckbox" name="descuentoLey" value="1" <%=checked1 %> >
                        <input type="hidden" name="descuentoLey" value="0" >
                    </div>
                    
                    <div class="container text-center py-4 md:col-span-2">
                        <label id="descuentoLabel">Monto de descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full text-center" type="text" id="porcentajeInput" name="porcentaje" value="<%= tipodescuento.getPorcentaje() %> ">
            
                    </div>
                    
                    <% 
                        String checked;
                        if(Integer.parseInt(tipodescuento.getHabilitado()) == 1){
                            checked = "checked";
                        }else{
                            checked = " ";
                        } 
                    %>

                    <div class="inline-flex px-4 items-center gap-3 mx-auto md:col-span-2">
                        <label>Habilitado:</label>
                        <input type="checkbox" name="habilitado" value="1" <%=checked %>>
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


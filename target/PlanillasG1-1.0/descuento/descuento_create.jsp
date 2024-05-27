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
<%
    // Verificar si el usuario está autenticado
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descuentos por empleado</title>
        <link rel="stylesheet" href="../css/output.css">
    </head>
    <body>
        <%
            int id_empleado = Integer.parseInt(request.getParameter("id"));
        %>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Agregar Descuento a empleado</h1>
    
                </div>

                <form action="descuento_store.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                    <!-- Recibe el id del empleado enviado desde la vista descuento2_index, para que lo procese la vista store -->
                    <input type="hidden" name="id" value="<%= id_empleado %>">

                    <div class="flex flex-col gap-2 px-4">

                        <label>Tipo de descuento:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="ID_TIPODESCUENTO" required>
                            <option value="">Selecciona un tipo de descuento...</option>
                            <% 
                                TipoDescuentoController controller = new TipoDescuentoController();
                                List<TipoDescuento> tipos = controller.mostrarTipoDescuentonoley();
                                
                                for(TipoDescuento tipo : tipos){
                                    if(Integer.parseInt(tipo.getHabilitado()) == 1){
                            %>
                            <option value="<%= tipo.getId_tipodescuento() %>"><%= tipo.getNombretipodesc() %></option>
                            <% 
                                    }
                                }//oninput="validarMonto(this)" required
                            %>
                        </select>

                    </div>
                    <div class="flex flex-col gap-2 px-4">
                        <label>Fecha de inicio del Descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="date" name="FECHADESCUENTO" required>
                    </div>
                    <div class="flex flex-col gap-2 px-4">
                        <label>Fecha de Fin del Descuento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="date" name="FECHADESCUENTOFIN" required>
                    </div>
                    <div class="flex flex-col gap-2 px-4">
                        <label>Monto($):</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="DESCUENTO" required>
                    </div>

                    <div class="inline-flex px-4 items-center gap-3">
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
                    <form action="./descuento2_index.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= id_empleado %>">
                        <button type="submit" class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded">
                            Listado de descuentos
                        </button>
                    </form>
                </div>

            </section>    

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

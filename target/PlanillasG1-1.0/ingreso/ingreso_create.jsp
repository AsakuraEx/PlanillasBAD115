<%@page import="java.time.LocalDate"%>
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
        <title>Ingresos por empleado</title>
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
        <%
            LocalDate fechaingreso = LocalDate.now();           
        %>
        
        <main class="bg-slate-100">
    
            <section class="container bg-white h-[600vh] min-h-full max-h-screen">
    
                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Agregar ingreso a empleado</h1>
    
                </div>
                
        
                <%
                    int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
                %>
                <form action="ingreso_store.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                        
                    <div class="flex flex-col gap-2 px-4">
                        <!-- Recibe el id del empleado enviado desde la vista ingreso_empleado, para que lo procese la vista store -->
                        <input type="hidden" name="id_empleado" value="<%= id_empleado %>">
                        <label>Tipo de ingreso:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_tipoingreso" required>
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
                    </div>
                        
                    <div class="flex flex-col gap-2 px-4">
                        <label>Fecha de ingreso:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="date" name="fechaingreso" max="<%=fechaingreso%>" required>                
                    </div>

                    <div class="flex flex-col gap-2 px-4">
                        <label>Monto($):</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="ingreso" oninput="validarMonto(this)" required>
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
                    <form action="./ingreso_empleado.jsp" method="POST">
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

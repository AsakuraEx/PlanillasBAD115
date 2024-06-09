<%@page import="java.time.LocalDate"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar si el usuario está autenticado
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<%
    int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
    int id_ingreso = Integer.parseInt(request.getParameter("id_ingreso"));
    
    IngresoController controller = new IngresoController();
    Ingreso ing = controller.search(id_ingreso);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresos</title>
        <link rel="stylesheet" href="../css/output.css">
    </head>
    <body onload="comenzarTiempo()">
            <% 
                String usuario = (String) session.getAttribute("usuario");
            %>
        <header class="bg-[#80BF96] shadow-md">

            <div class="container text-center text-white">
        
                    <h1 class="text-2xl font-bold py-4 md:text-3xl ">
                        <a href="../index.jsp">Sistema de Planillas</a>
                    </h1>

            </div>  
            <div class="px-12 py-4 text-2xl text-xl flex justify-between bg-black text-white" > 
                <p>Bienvenido:  <%=usuario %> </p>
                <p id="fecha"></p>
            </div>            
    
        </header>
            <%
                LocalDate fechaingreso = LocalDate.now();
            %>
            
            <main class="bg-slate-100">
        
                <section class="container bg-white h-[600vh] min-h-full max-h-screen">
        
                    <div class="container text-center py-8">
        
                        <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Editar ingreso de empleado</h1>
        
                    </div>

                    <form action="ingreso_update_1.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                        

                        <!-- Enviar el id del ingreso y del empleado a editar, para que lo procese la vista update -->
                        <input type="hidden" name="id_empleado" value="<%= id_empleado %>">
                        <input type="hidden" name="id_ingreso" value="<%= id_ingreso %>">

                        <div class="flex flex-col gap-2 px-4">
                            <label>Tipo de ingreso:</label>
                            <select class="border rounded-lg py-1 px-4 w-full" name="id_tipoingreso" required>
                                <option value="">Seleccione un tipo de ingreso...</option>
                                <%                         
                                    TipoIngresoController controllerTipo = new TipoIngresoController();
                                    List<TipoIngreso> tipoIng = controllerTipo.mostrarTipoIngreso();
                                    
                                    for(TipoIngreso tipo : tipoIng){
                                        if(Integer.parseInt(tipo.getHabilitado()) == 1){
                                %>
                                <% String selected = (tipo.getId_tipoingreso() == ing.getId_tipoingreso())? "selected" : " ";  %>
                                <option value="<%= tipo.getId_tipoingreso() %>" <%=selected %>><%= tipo.getNombretipoingreso() %></option>
                                <%  
                                        }
                                    }
                                %>
                            </select>
                        </div>
                            
                        <div class="flex flex-col gap-2 px-4">
                            <label>Fecha:</label>
                            <input class="border rounded-lg py-1 px-4 w-full" type="date" name="fechaingreso" max="<%=fechaingreso%>" value="<%=ing.getFechaingreso() %>" required>                
                        </div>
                        
                        <div class="flex flex-col gap-2 px-4">
                            <label>Monto($):</label>
                            <input class="border rounded-lg py-1 px-4 w-full" type="text" name="ingreso" value="<%=ing.getIngreso() %>" required pattern="^\d+(\.\d{1,2})?$" title="Ingrese un valor numérico con hasta dos decimales.">
                        </div>

                        <div class="inline-flex px-4 items-center gap-3">
                            <% 
                                String checked;
                                if(Integer.parseInt(ing.getHabilitado()) == 1){
                                    checked = "checked";
                                }else{
                                    checked = " ";
                                } 
                            %>
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
       
    function comenzarTiempo(){

        setInterval(actualizarTiempo, 1000);
    }

    function actualizarTiempo(){
        let fecha = new Date();
        let texto = document.getElementById("fecha");

        let dia = String(fecha.getDate()).padStart(2, '0');
        let mes = String(fecha.getMonth() + 1).padStart(2, '0');
        let anio = String(fecha.getFullYear());
        let hora = String(fecha.getHours()).padStart(2, '0');
        let minuto = String(fecha.getMinutes()).padStart(2, '0');
        let segundo = String(fecha.getSeconds()).padStart(2, '0');    
        texto.textContent = dia + '/' + mes + '/' + anio + ' ' + hora + ':' + minuto + ':' + segundo;
    }
</script>

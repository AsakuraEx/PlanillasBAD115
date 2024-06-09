<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%      
        int id = Integer.parseInt(request.getParameter("id"));
        Empleado empleado =new Empleado();
        EmpleadoController empleadoController = new EmpleadoController();
        empleado = empleadoController.search(id);   
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso Empleado</title>
        <link rel="stylesheet" href="../css/output.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
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
        <main class="bg-slate-100">

            <section class="container bg-white h-screen">
    
                <div class="container text-center py-8 text-[#629c76]">
    
                    <h1 class="font-bold text-2xl md:text-3xl pb-4 ">Detalle de ingresos de: </h1>
                    <h2 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96]">
                        <%=empleado.getPrimernombre() %> 
                        <%
                            if(empleado.getSegundonombre() != null){
                        %>
                                <%=empleado.getSegundonombre()%>
                        <%
                            }
                        %> 
                        <%=empleado.getPrimerapellido() %> 
                        <%
                            if(empleado.getSegundoapellido() != null){
                        %>
                                <%=empleado.getSegundoapellido()%>
                        <%
                            }
                        %> 
                        <%
                            if(empleado.getApellidocasada() != null){
                        %>
                                <%=empleado.getApellidocasada()%>
                        <%
                            }
                        %>
                    </h2>
    
                </div>    

                <div class="flex justify-center items-center flex-col gap-2 md:flex-row md:justify-start mb-8">

                    <a class="font-bold bg-[#f2f2f2] px-4 py-2 rounded-md text-black hover:bg-[#d4d4d4] md:ml-8 hover:text-black" 
                    href="/PlanillasG1/descuento/descuento_index.jsp">Regresar</a>

                    <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold text-white md:ml-8 hover:bg-[#5b9670]" 
                    href="ingreso_create_1.jsp?id_empleado=<%= empleado.getId_empleado() %>">Agregar nuevo ingreso</a>

                </div>
                <div class="overflow-x-auto px-8 pb-8">
                    <table id="example" class="table-auto mx-auto md:w-full">
                        <thead class="text-center border-b-2 border-slate-600 py-3 px-8">
                            <td class="px-2 py-2">Tipo de ingreso</td>
                            <td class="px-2 py-2">Monto</td>
                            <td class="px-2 py-2">Fecha de registro</td>
                            <td class="px-2 py-2">Estado</td>
                            <td class="px-2 py-2">Acciones</td>
                        </thead>
                        <%
                            TipoIngresoController controllerTipo = new TipoIngresoController();
                            TipoIngreso tipoIng= new TipoIngreso();
                            String mensaje;
                        %>
                        <tbody>
                            <%      
                            IngresoController ingEmpleado = new IngresoController();
                            List<Ingreso> ingresos = ingEmpleado.mostrarIngresosPorEmpleado(empleado.getId_empleado());

                                for(Ingreso ing : ingresos){
                            %>
                            <tr class="text-center border-b border-slate-400">                    
                                <% 
                                    tipoIng=controllerTipo.search(ing.getId_tipoingreso());
                                %>
                                <td class="px-8 py-2 md:px-1"><%= tipoIng.getNombretipoingreso() %></td>                    
                                <td class="px-8 py-2 md:px-1">$ <%=ing.getIngreso() %></td>
                                <td class="px-8 py-2 md:px-1"><%=ing.getFechaingreso() %></td>
                                <% 
                                    if(Integer.parseInt(ing.getHabilitado()) == 1){ 
                                        mensaje = "Habilitado";
                                    }else{ 
                                        mensaje = "Deshabilitado";
                                    }; 
                                %>
                                <td class="px-8 py-2 md:px-1"><%=mensaje %></td>
                                <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                    <form action="ingreso_editar_1.jsp" method="POST"
                                    class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                        <input type="hidden" name="id_ingreso" value="<%= ing.getId_ingreso() %>">
                                        <input type="hidden" name="id_empleado" value="<%= ing.getId_empleado() %>">
                                        <input type="submit" value="Editar">
                                    </form>                    
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
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
<script>
    $(document).ready( function () {
       $('#example').DataTable();
   });   
</script>
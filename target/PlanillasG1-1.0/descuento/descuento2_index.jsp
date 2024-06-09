<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.DescuentoController"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="Models.TipoDescuento"%>
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
        <title>Descuentos por empleado</title>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl pb-4 ">Detalle de descuentos de: </h1>
                    <h2 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96]">
                        <%=empleado.getPrimernombre()%> 
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
                <!-- Enviar el id del empleado a la vista descuento_create -->
                <div class="flex justify-center items-center flex-col gap-2 md:flex-row md:justify-start mb-8">

                    <a class="font-bold bg-[#f2f2f2] px-4 py-2 rounded-md text-black hover:bg-[#d4d4d4] md:ml-8 hover:text-black" 
                    href="descuento_index.jsp">Regresar</a>
                    
                    <form action="descuento_create.jsp" method="POST"
                    class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold text-white md:ml-8 hover:bg-[#5b9670]">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="submit" value="Agregar nuevo descuento">
                    </form> 
                </div>
                <div class="overflow-x-auto px-8 pb-8">
                    <table id="example" class="table-auto mx-auto md:w-full">
                        <thead class="text-center border-b-2 border-slate-600 py-3 px-8">
                            <td class="px-2 py-2">Tipo descuento</td>
                            <td class="px-2 py-2">Monto</td>
                            <td class="px-2 py-2">Estado</td>
                            <td class="px-2 py-2">Accion</td>
                        </thead>
                        <%
                            TipoDescuentoController controllerTipo = new TipoDescuentoController();
                            TipoDescuento tipo1= new TipoDescuento();
                            String mensaje;
                        %>
                        <tbody>
                            <%      
                                DescuentoController descuentosPorEmpleado = new DescuentoController();
                                List<Descuento> Descuentosp = descuentosPorEmpleado.mostrarDescuentosPorEmpleado(empleado.getId_empleado());

                                    for(Descuento des : Descuentosp){
                            %>
                            <tr class="text-center border-b border-slate-400">                    
                                <% 
                                    tipo1=controllerTipo.search(des.getID_TIPODESCUENTO());
                                %>
                                <td class="px-8 py-2 md:px-1"><%= tipo1.getNombretipodesc()%></td>                    
                                <td class="px-8 py-2 md:px-1"><%=String.format("%.2f", des.getDESCUENTO())%></td>
                                <% 
                                    if(Integer.parseInt(des.getHabilitado()) == 1){ 
                                        mensaje = "Habilitado";
                                    }else{ 
                                        mensaje = "Deshabilitado";
                                    }; 
                                %>
                                <td class="px-8 py-2 md:px-1"><%=mensaje %></td>
                                <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                    <% TipoDescuentoController tipo2=new TipoDescuentoController(); 
                                    TipoDescuento descuento3 =new TipoDescuento();
                                    descuento3=tipo2.search(des.getID_TIPODESCUENTO());
                                    int w=Character.getNumericValue(descuento3.getDescuentoLey().charAt(0));
                                    int s=tipo2.mostrarTipoDescuentoRentaint(descuento3.getId_tipodescuento());
                                    %>
                                    
                                    <% if (w == 0&&s!=1) { %>
                                    <form action="descuento_edit.jsp" method="POST">
                                        <input type="hidden" name="id_descuento" value="<%= des.getID_DESCUENTO()%>">
                                        <input type="hidden" name="id" value="<%= des.getID_EMPLEADO()%>">
                                        <input type="submit" value="Editar" class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                    </form>  <% }  else{ %>
                                    <!-- Mostrar un botón deshabilitado para indicar que no es editable -->
                                    <button class="font-medium bg-gray-400 px-4 py-2 rounded-md text-black" disabled>Editar</button>
                                    <% }%>
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

<%@page import="Controllers.MesController"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Mes"%>
<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.PresupuestoController"%>
<%@page import="Models.Presupuesto"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar si el usuario está autenticado
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
    <% 
        String rol = (String) session.getAttribute("rol");
        if("r".equals(rol)){
            response.sendRedirect("../index.jsp");
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuesto</title>
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
                LocalDate now = LocalDate.now(); 
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM yyyy");
                String usuario = (String) session.getAttribute("usuario");
                int currentYear = now.getYear();
                int currentMonth = now.getMonthValue();
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
    
                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Presupuesto</h1>
    
                </div>
    
                <div class="flex justify-center items-center md:justify-start mb-8">
    
                    <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold 
                    text-white md:ml-8 hover:bg-[#5b9670]" 
                    href="presupuesto_create.jsp">Crear nuevo presupuesto</a>
    
                </div>
                <div class="overflow-x-auto px-8 pb-8">
                    <table id="example" class="table-auto mx-auto md:w-full">
                        <thead class="text-center border-b-2 border-slate-600 py-3 px-8">
                            <td class="px-2 py-2">Departamento asociado</td>
                            <td class="px-2 py-2">Fecha</td>
                            <td class="px-2 py-2">Monto asignado</td>
                            <td class="px-2 py-2">Presupuesto restante</td>
                            <td class="px-2 py-2">Estado</td>
                            <td class="px-2 py-2">Accion</td>
                        </thead>
                        <%
                            
                            DepUnidadOrganiController controllerdep = new DepUnidadOrganiController();
                            DepUnidadOrgani depunidad = new DepUnidadOrgani();

                            PresupuestoController controller = new PresupuestoController();
                            List<Presupuesto> presupuestos = controller.mostrarPresupuestos();
                            EmpleadoController controllerEmpleado = new EmpleadoController();
                            
                            String mensaje;
                        %>
                        <tbody>
                            <%
                                for(Presupuesto presupuesto : presupuestos){
                                double presupuesto1 = controllerEmpleado.presupuestoNeto(currentMonth, currentYear);
                            %>
                            <tr class="text-center border-b border-slate-400">
                                <% 
                                    depunidad = controllerdep.search(presupuesto.getId_deporg());
                                %>
                                <td class="px-8 py-2 md:px-1"><%= depunidad.getNombredeporg() %></td>

                                <td class="px-8 py-2 md:px-1"><%= presupuesto.getFecha() %></td>
                                
                                <td class="px-8 py-2 md:px-1"> $ <%=presupuesto.getMonto() %></td>
                                <td class="px-8 py-2 md:px-1"><%=presupuesto1 %></td>
                                
                                <% 
                                    if(Integer.parseInt(presupuesto.getHabilitado()) == 1){ 
                                        mensaje = "Habilitado";
                                    }else{ 
                                        mensaje = "Deshabilitado";
                                    }; 
                                %>
                                <td class="px-8 py-2 md:px-1"><%=mensaje %></td>
                                
                                <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                    <form action="presupuesto_edit.jsp" method="POST"
                                    class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                        <input type="hidden" name="id" value="<%= presupuesto.getId_presupuesto() %>">
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
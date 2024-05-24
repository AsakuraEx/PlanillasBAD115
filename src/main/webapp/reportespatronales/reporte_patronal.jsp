<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.DescuentoController"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="Models.TipoDescuento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aportes Patronales</title>
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
    
            <section class="container bg-white h-screen">
    
                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Reporte de Aportes Patronales</h1>
    
                </div>

                <div class="overflow-x-auto px-8 pb-8">

                    <table class="table-auto mx-auto md:w-full">
                    <thead class="text-center border-b-2 border-slate-600 py-3 px-8">
                        <tr>
                            <td class="px-2 py-2">Empleado</td>
                            <td class="px-2 py-2">Salario</td>
                            <td class="px-2 py-2">ISSS Patronal</td>
                            <td class="px-2 py-2">AFP Patronal</td>
                            <td class="px-2 py-2">Total de aportes</td>
                        </tr>
                        <%
                            EmpleadoController controllerEmpleado = new EmpleadoController();
                            List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();       

                            TipoDescuentoController tipoController = new TipoDescuentoController();
                            List<TipoDescuento> tipos = tipoController.descFiltrados();
                            double isssP = 0.0;
                            double afpPl = 0.0;
                            double sumaTotalAportes = 0.0;
                            
                            for (Empleado empleado : empleados) {
                                double isssPatronal = 0.0;
                                
                                double afpPatronal = 0.0;
                                

                                for (TipoDescuento t : tipos) {
                                    double aporte = empleado.getSalario() * (t.getPorcentaje() / 100.0);
                                    double valorPorcentaje = t.getPorcentaje();
                                    String nombreTipoDesc = t.getNombretipodesc().trim();

                                    if ("ISSS Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                                        isssPatronal = aporte;
                                        isssP = valorPorcentaje;
                                    } else if ("AFP Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                                        afpPatronal = aporte;
                                        afpPl = valorPorcentaje;
                                    }
                                }
                                double totalAportes = isssPatronal + afpPatronal;
                                sumaTotalAportes += totalAportes;
                            }
                        %>
                        <tr class="text-center border-b-2 border-slate-600">
                            <td class="px-8 py-2 md:px-1 font-bold"></td>
                            <td class="px-8 py-2 md:px-1 font-bold"></td>
                            <td class="px-8 py-2 md:px-1 font-bold"><%= String.format("%.2f", isssP) %></td>
                            <td class="px-8 py-2 md:px-1 font-bold"><%= String.format("%.2f", afpPl) %></td>
                            <td class="px-8 py-2 md:px-1 font-bold">$ <%= String.format("%.2f", sumaTotalAportes) %></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Empleado empleado : empleados) {
                                double isssPatronal = 0.0;
                                double afpPatronal = 0.0;

                                for (TipoDescuento t : tipos) {
                                    double aporte = empleado.getSalario() * (t.getPorcentaje() / 100.0);
                                    String nombreTipoDesc = t.getNombretipodesc().trim();

                                    if ("ISSS Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                                        isssPatronal = aporte;
                                    } else if ("AFP Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                                        afpPatronal = aporte;
                                    }
                                }
                                double totalAportes = isssPatronal + afpPatronal;
                        %>
                        <tr class="text-center border-b border-slate-400">
                            <td class="px-8 py-2 md:px-1">
                                <%= empleado.getPrimernombre() %> 
                                <%
                                    if (empleado.getSegundonombre() != null) {
                                %>
                                        <%= empleado.getSegundonombre() %>
                                <%
                                    }
                                %> 
                                <%= empleado.getPrimerapellido() %> 
                                <%
                                    if (empleado.getSegundoapellido() != null) {
                                %>
                                        <%= empleado.getSegundoapellido() %>
                                <%
                                    }
                                %> 
                                <%
                                    if (empleado.getApellidocasada() != null) {
                                %>
                                        <%= empleado.getApellidocasada() %>
                                <%
                                    }
                                %>
                            </td>                    

                            <td class="px-8 py-2 md:px-1">$ <%= empleado.getSalario() %></td>
                            <td class="px-8 py-2 md:px-1">$ <%= String.format("%.2f", isssPatronal) %> </td>
                            <td class="px-8 py-2 md:px-1">$ <%= String.format("%.2f", afpPatronal) %> </td>
                            <td class="px-8 py-2 md:px-1">$ <%= String.format("%.2f", totalAportes) %></td>
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

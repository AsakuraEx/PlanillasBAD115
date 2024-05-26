<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.IngresoController"%>
<%@page import="Models.Ingreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresos</title>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Ingreso</h1>
    
                </div>

                <div class="overflow-x-auto px-8 pb-8">

                    <table class="table-auto mx-auto md:w-full">
                        <thead class="text-center border-b-2 border-slate-600 py-3 px-8">
                            <td class="px-2 py-2">Empleado</td>
                            <td class="px-2 py-2">Salario</td>
                            <td class="px-2 py-2">Ingresos totales</td>
                            <td class="px-2 py-2">Accion</td>
                        </thead>
                        <%
                            EmpleadoController controllerEmpleado = new EmpleadoController();
                            List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();                            
                        %>
                        <tbody>
                            <%
                                for(Empleado empleado : empleados){
                            %>
                            <tr class="text-center border-b border-slate-400">
                                <td class="px-8 py-2 md:px-1">
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
                                </td>

                                <td class="px-8 py-2 md:px-1">$ <%= empleado.getSalario()%></td>

                                <%
                                    EmpleadoController controllerEmp = new EmpleadoController();
                                    double totalIng = controllerEmp.sumarIngresosEmpleado(empleado.getId_empleado());
                                %>
                                                             
                                <td class="px-8 py-2 md:px-1">$ <%= totalIng%></td>
                                
                                <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                    <form action="ingreso_empleado.jsp" method="POST"
                                    class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                        <input type="hidden" name="id" value="<%=empleado.getId_empleado()%>">
                                        <input type="submit" value="Detalle">
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

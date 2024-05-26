<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Models.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Empleados</h1>
    
                </div>
    
                <div class="flex justify-center items-center md:justify-start mb-8">
    
                    <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold 
                    text-white md:ml-8 hover:bg-[#5b9670]" 
                    href="empleado_create.jsp">Crear nuevo empleado</a>
    
                </div>

                <div class="overflow-x-auto px-4 pb-8">

                    <table class="table-auto mx-auto md:w-full">
                        <thead class="border-b-2 border-slate-600 py-3 px-12 text-center">
                            <td class="px-2 py-2">Nombre</td>
                            <td class="px-1 py-2">Fecha de Nacimiento</td>
                            <td class="px-2 py-2">Fecha de Ingreso</td>                
                            <td class="px-2 py-2">Salario</td>
                            <td class="px-2 py-2">Correo Personal</td>
                            <td class="px-2 py-2">Correo Institucional</td>
                            <td class="px-2 py-2">Habilitado</td>
                            <td class="px-2 py-2">Accion</td>
                        </thead>
                        <%
                            EmpleadoController controllerEmpleado = new EmpleadoController();
                            List<Empleado> empleados = controllerEmpleado.mostrarTodosEmpleados();
            
                        %>
                        <tbody>
                            <%
                                for(Empleado empleado : empleados){
                            %>
                            <tr class="text-center border-b border-slate-400 px-12 gap-4">
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
                                <td class="px-8 py-2 md:px-1"><%= empleado.getFechanacimiento()  %></td>
                                <td class="px-8 py-2 md:px-1"><%= empleado.getFechaingresosistema()  %></td>
                                <td class="px-8 py-2 md:px-1">$ <%= empleado.getSalario()  %></td>
                                <td class="px-12 py-2 md:px-1"><%= empleado.getCorreopersonal()  %></td>
                                <td class="px-12 py-2 md:px-1"><%= empleado.getCorreoinstitucional()  %></td>
                                <td class="px-8 py-2 md:px-1">
                                    <%
                                        if(Integer.parseInt(empleado.getHabilitado())== 1){
                                    %>
                                        Habilitado
                                    <%
                                        }else{
                                    %>
                                        Deshabilitado
                                    <%
                                        }
                                    %>
                                </td>                    
                                <td class="inline-flex flex-col gap-2 py-2 md:w-52">
                                    <form action="empleado_edit.jsp" method="POST"
                                    class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                        <input type="hidden" name="id" value="<%= empleado.getId_empleado() %>">
                                        <input type="submit" value="Editar">
                                    </form> 
                                    <form action="empleado_show.jsp" method="POST"
                                    class="font-bold bg-[#B8D9BA] px-4 py-2 rounded-md text-black hover:bg-[#92bb95] hover:text-black">
                                        <input type="hidden" name="id" value="<%= empleado.getId_empleado() %>">
                                        <input type="hidden" name="id_documento" value="<%= empleado.getId_empleado() %>">
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

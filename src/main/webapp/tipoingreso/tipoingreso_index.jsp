<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

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
        String rol = (String) session.getAttribute("rol");
        if("r".equals(rol)){
            response.sendRedirect("../index.jsp");
        }
    %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Tipos de Ingreso</title>
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

                <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Tipos de Ingreso</h1>

            </div>

            <div class="flex justify-center items-center md:justify-start mb-8">

                <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold 
                text-white md:ml-8 hover:bg-[#5b9670]" 
                href="tipoingreso_create.jsp">Crear nuevo tipo de ingreso</a>

            </div>

            <div class="overflow-x-auto px-8 pb-8">
                <table class="table-auto mx-auto md:w-full">
                    <tr class="text-center border-b-2 border-slate-600 py-3 px-8">
                        <th class="px-2 py-2">Nombre</th>
                        <th class="px-2 py-2">Estado</th>
                        <th class="px-2 py-2">Acción</th>
                    </tr>
                        <%
                
                            TipoIngresoController controller = new TipoIngresoController();
                            List<TipoIngreso> ingresos = controller.mostrarTipoIngreso();
                            String m1;
                            for(TipoIngreso ingreso : ingresos){
                        %>
                    <tr class="text-center border-b border-slate-400">
                        <td class="px-8 py-2 md:px-1"><%=ingreso.getNombretipoingreso() %></td>
                            <%
                                if (Integer.parseInt(ingreso.getHabilitado()) == 1) {
                                    m1 = "Habilitado";
                                } else {
                                    m1 = "Deshabilitado";
                                };
                            %>
                        <td class="px-8 py-2 md:px-1"><%=m1%></td>
                        <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                            <form action="tipoingreso_edit.jsp" method="POST"
                            class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                <input type="hidden" name="id" value="<%=ingreso.getId_tipoingreso() %>">
                                <input type="submit" value="Editar">
                            </form>
                            <form action="tipoingreso_delete.jsp" method="POST"
                            class="font-bold bg-[#f2f2f2] px-4 py-2 rounded-md text-black hover:bg-[#d4d4d4] hover:text-black">
                                <input type="hidden" name="id" value="<%=ingreso.getId_tipoingreso() %>">
                                <input type="hidden" name="habilitado" value="0">
                                <input type="submit" value="Eliminar">
                            </form>
                        </td>
                    </tr>
                        <%
                            }
                        %>
                </table>                
            </div>

</body>
</html>



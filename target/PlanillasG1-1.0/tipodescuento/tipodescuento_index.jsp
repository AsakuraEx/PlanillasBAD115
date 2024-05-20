<%@page import="java.util.List"%>
<%@page import="Models.TipoDescuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de tipos de descuentos</title>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Tipos de Descuento</h1>
    
                </div>
    
                <div class="flex justify-center items-center md:justify-start mb-8">
    
                    <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold 
                    text-white md:ml-8 hover:bg-[#5b9670]" 
                    href="tipodescuento_create.jsp">Crear nuevo tipo de ingreso</a>
    
                </div>

                <div class="overflow-x-auto px-8 pb-8">
                    <table class="table-auto mx-auto md:w-full">
                        <tr class="text-center border-b-2 border-slate-600 py-3 px-8">
                            <th class="px-2 py-2">Nombre del tipo de descuento</th>
                            <th class="px-2 py-2">Descuento de Ley</th>
                            <th class="px-2 py-2">Descuento Patronal</th>
                            <th class="px-2 py-2">Porcentaje</th>
                            <th class="px-2 py-2">Estado</th>
                            <th class="px-2 py-2">Accion</th>
                        </tr>
                        <%
            
                            TipoDescuentoController controller = new TipoDescuentoController();
                            List<TipoDescuento> tiposdescuentos = controller.mostrarTipoDescuento();
                            String m1, m2, m3;
                            for (TipoDescuento tipodescuento : tiposdescuentos) {
                        %>
                        <tr class="text-center border-b border-slate-400">
            
                            <td class="px-8 py-2 md:px-1"><%= tipodescuento.getNombretipodesc()%></td>
                            
                            <%
                                if (Integer.parseInt(tipodescuento.getDescuentoLey() ) == 1 ) {
                                    m1 = "Sí";
                                } else {
                                    m1 = "No";
                                };
                            %>
                            <td class="px-8 py-2 md:px-1"><%=m1%></td>
                            
                                                        <%
                                if (Integer.parseInt(tipodescuento.getDescuentoPatronal() ) == 1 ) {
                                    m2 = "Sí";
                                } else {
                                    m2 = "No";
                                };
                            %>
                            <td class="px-8 py-2 md:px-1"><%=m2%></td>
                            
                            <td class="px-8 py-2 md:px-1"><%= tipodescuento.getPorcentaje() %></td>
            
                            <%
                                if (Integer.parseInt(tipodescuento.getHabilitado()) == 1) {
                                    m3 = "Habilitado";
                                } else {
                                    m3 = "Deshabilitado";
                                };
                            %>
                            <td class="px-8 py-2 md:px-1"><%=m3%></td>
            
                            <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                <form action="tipodescuento_edit.jsp" method="POST"
                                class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                    <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento()%>">
                                    <input type="submit" value="Editar">
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

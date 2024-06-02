<%-- 
    Document   : depuni_index
    Created on : 25 abr 2024, 8:39:15 p. m.
    Author     : Juanjo
--%>

<%@page import="Controllers.DepUnidadOrganiController"%>
<%@page import="Models.DepUnidadOrgani"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="java.util.List"%>
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
        <title>JSP Page</title>
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

        <main class="bg-slate-100">

            <section class="container bg-white h-screen">

                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Departamentos de unidades organizativas</h1>
    
                </div>
                <div class="flex justify-center items-center md:justify-start mb-8">
    
                    <a class="bg-[#80BF96] py-2 px-4 text-center rounded-md font-bold 
                    text-white md:ml-8 hover:bg-[#5b9670]" 
                    href="depuni_create.jsp">Crear nuevo departamento</a>
    
                </div>
                <div class="overflow-x-auto px-8 pb-8">

                    <table class="table-auto mx-auto md:w-full">
                        <thead class="border-b-2 border-slate-600 py-3 px-8">
                            <td class="px-2 py-2">Nombre de Departamento de Unidad</td>
                            <td class="px-2 py-2">Unidad Asociada</td>
                            <td class="px-2 py-2">Estado</td>
                            <td class="px-2 py-2">Accion</td>
                        </thead>
                        <%
                            UnidadorgController controller1 = new UnidadorgController();
                            Unidadorganizativa uni = new Unidadorganizativa();
    
                            DepUnidadOrganiController controller = new DepUnidadOrganiController();
                            List<DepUnidadOrgani> unidades = controller.mostrarUnidades1();   
    
                            String mensaje;
                        %>
                        <tbody>
                            <%
                                for(DepUnidadOrgani unidad : unidades){
                            %>
                            <tr class="text-center border-b border-slate-400">
                                <td class="px-8 py-2 md:px-1"><%=unidad.getNombredeporg()%></td>
                                
                                <% 
                                    uni = controller1.search(unidad.getId_unidadorg());
                                %>
                                <td class="px-8 py-2 md:px-1"><%= uni.getNombreunidadorg()%></td>
                                
                                <% 
                                    if(Integer.parseInt(unidad.getHabilitado()) == 1){ 
                                        mensaje = "Habilitado";
                                    }else{ 
                                        mensaje = "Deshabilitado";
                                    }; 
                                %>
                                <td class="px-8 py-2 md:px-1"><%=mensaje %></td>
                                <td class="inline-flex flex-col md:flex-row gap-2 py-2">
                                    <form action="depuni_edit.jsp" method="POST"
                                    class="font-bold bg-[#E1F2D5] px-4 py-2 rounded-md text-[#67814a] hover:bg-[#91aa7f] hover:text-white">
                                
                                        <input type="hidden" name="id" value="<%= unidad.getId_deporg() %>">
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
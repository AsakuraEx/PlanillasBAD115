<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

<%@page import="Models.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.EmpresaController"  %>
<%
    // Verificar si el usuario está autenticado
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<%

    int id = Integer.parseInt(request.getParameter("id"));
    EmpresaController controller = new EmpresaController();
    Empresa empresa = controller.search(id);

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
        <title>Editar Empresa</title>
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

            <section class="container bg-white h-[600vh] min-h-full max-h-screen">

                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Formulario de Registro de Empresa</h1>
    
                </div>
                
                <form action="empresa_update.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                    
                    <input type="hidden" name="id" value="<%= empresa.getId_empresa() %>">
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Nombre de Empresa:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="nombreempresa" value="<%= empresa.getNombreempresa() %>" required>
                    </div>

                    <div class="flex flex-col gap-2 px-4">

                        <label>Correo:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="email" name="correoempresa" value="<%= empresa.getCorreoempresa() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4 md:col-span-2">

                        <label>Direccion:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="direccion" value="<%= empresa.getDireccion() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4">

                        <label>NIC:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="nic" value="<%= empresa.getNic() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4">

                        <label>NIT:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="nit" pattern="\d{4}-\d{6}-\d{3}-\d{1}" placeholder="####-######-###-#" value="<%= empresa.getNit() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4">

                        <label>Telefono:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="telefono" pattern="\d{4}-\d{4}" placeholder="####-####" value="<%= empresa.getTelefono() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4">

                        <label>Pagina Web:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="paginaweb" value="<%= empresa.getPaginaweb() %>">

                    </div>

                    <div class="flex flex-col gap-2 px-4 md:col-span-2 md:flex-row md:mx-auto md:my-4">

                        <button class="bg-[#80BF96] hover:bg-[#629c76] py-2 px-4 text-center rounded-md font-bold text-white md:w-32" type="submit">
                            Guardar
                        </button>
                        <button class="font-bold bg-[#f2f2f2] px-4 py-2 rounded-md text-black hover:bg-[#d4d4d4] hover:text-black md:w-32" type="reset">
                            Limpiar
                        </button>

                    </div>


                </form>        
                     
                <div class="md:mx-auto flex justify-center py-12">

                    <a class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded" href="./empresa_index.jsp">Regresar al listado</a>

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
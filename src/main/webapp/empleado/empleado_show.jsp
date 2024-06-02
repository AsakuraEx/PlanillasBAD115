<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

<%@page import="Models.TipoDocumento"%>
<%@page import="Controllers.TipoDocumentoController"%>
<%@page import="Models.Documento"%>
<%@page import="Controllers.DocumentoController"%>
<%@page import="Models.Municipio"%>
<%@page import="Controllers.MunicipioController"%>
<%@page import="Models.Departamento"%>
<%@page import="Controllers.DepartamentoController"%>
<%@page import="Models.Puesto"%>
<%@page import="Controllers.PuestoController"%>
<%@page import="Models.Profesion"%>
<%@page import="Controllers.ProfesionController"%>
<%@page import="Models.EstadoCivil"%>
<%@page import="Controllers.EstadoCivilController"%>
<%@page import="Models.Sexo"%>
<%@page import="Controllers.SexoController"%>
<%@page import="Models.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    EmpleadoController controller = new EmpleadoController();
    Empleado empleado = new Empleado();
    
    empleado = controller.search(Integer.parseInt(request.getParameter("id")));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle del empleado</title>
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
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Detalle del Empleado</h1>
    
                </div>

                <table class="table-fixed w-1/2 mx-auto">
                        <thead class="bg-[#80BF96] text-center text-white">
                            <td><strong> Campo </strong></td>
                            <td><strong> Valor </strong></td>
                        </thead>
                        <tbody>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4"><strong>Fecha de registro en el sistema</strong></td>
                                <td class="text-center font-light"><%=empleado.getFechaingresosistema() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Primer Nombre</td>
                                <td class="text-center font-light"><%=empleado.getPrimernombre() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Segundo Nombre</td>
                                <td class="text-center font-light"><%=empleado.getSegundonombre() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Primer Apellido</td>
                                <td class="text-center font-light"><%=empleado.getPrimerapellido() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Segundo Apellido</td>
                                <td class="text-center font-light"><%=empleado.getSegundoapellido() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Apellido Casada</td>
                                <td class="text-center font-light"><%=empleado.getApellidocasada() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Fecha de Nacimiento</td>
                                <td class="text-center font-light"><%=empleado.getFechanacimiento() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Salario</td>
                                <td class="text-center font-light">$ <%=empleado.getSalario() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">NIT</td>
                                <td class="text-center font-light"><%=empleado.getNit() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">NUP</td>
                                <td class="text-center font-light"><%=empleado.getNup() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">ISSS</td>
                                <td class="text-center font-light"><%=empleado.getNumeroisss() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Correo Personal</td>
                                <td class="text-center font-light"><%=empleado.getCorreopersonal() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Correo Institucional</td>
                                <td class="text-center font-light"><%=empleado.getCorreoinstitucional() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Sexo</td>
                                <td class="text-center font-light">
                                    <%
                                        SexoController sexoController = new SexoController();
                                        Sexo sexo = new Sexo();
                                        sexo = sexoController.search(empleado.getId_sexo());
                                    %>
                                    <%=sexo.getNombreSexo() %>
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Estado Civil</td>
                                <td class="text-center font-light">
                                    <%
                                        EstadoCivilController estadoController = new EstadoCivilController();
                                        EstadoCivil estado = new EstadoCivil();
                                        estado = estadoController.search(empleado.getId_estadocivil());
                                    %>
                                    <%=estado.getNombreestadocivil() %>
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Profesion</td>
                                <td class="text-center font-light">
                                    <%
                                        ProfesionController profesionController = new ProfesionController();
                                        Profesion profesion = new Profesion();
                                        profesion = profesionController.search(empleado.getId_profesion());
                                    %>
                                    <%=profesion.getNombreprofesion() %>
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Puesto</td>
                                <td class="text-center font-light">
                                    <%
                                        PuestoController puestoController = new PuestoController();
                                        Puesto puesto = new Puesto();
                                        puesto = puestoController.search(empleado.getId_puesto());
                                    %>
                                    <%=puesto.getNombrepuesto() %>
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Departamento</td>
                                <td class="text-center font-light">
                                    <%
                                        DepartamentoController departamentoController = new DepartamentoController();
                                        Departamento departamento = new Departamento();
                                        
                                        MunicipioController municipioController = new MunicipioController();
                                        Municipio municipio = new Municipio();
                                        municipio = municipioController.search(empleado.getId_municipio());
                                        
                                        departamento = departamentoController.search(municipio.getId_departamento());
                                    %>
                                    <%=puesto.getNombrepuesto() %>
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Municipio</td>
                                <td class="text-center font-light"><%=municipio.getNombremunicipio() %></td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">Tipo de documento</td>
                                <td class="text-center font-light">                                  
                                    <%
                                        DocumentoController controllerDoc = new DocumentoController();
                                        List<Documento> documentos = controllerDoc.mostrarDocumentos(empleado.getId_empleado());
                                        TipoDocumentoController controllerTipodoc = new TipoDocumentoController();
                                        List<TipoDocumento> tipoDocs = controllerTipodoc.mostrarTipoDocumento(); 
                                        for (TipoDocumento tipoDoc : tipoDocs) {
                                            for (Documento documento : documentos) {
                                                if (tipoDoc.getId_tipodocumento() == documento.getId_tipodocumento()) {
                                            %>
                                                        <%= tipoDoc.getNombretipodocumento() %>
                                            <% 
                                                    break; 
                                                }
                                            } 
                                            %>
                                        <% }                                        
                                        %>                              
                                </td>
                            </tr>
                            <tr class="border-b border-slate-500">
                                <td class="pl-4">N° de documento</td>
                                <td class="text-center font-light">
                                    <%
                                        DocumentoController controllerDoc1 = new DocumentoController();
                                        List<Documento> documentos1 = controllerDoc1.mostrarDocumentos(empleado.getId_empleado());
                                        TipoDocumentoController controllerTipodoc1 = new TipoDocumentoController();
                                        List<TipoDocumento> tipoDocs1 = controllerTipodoc1.mostrarTipoDocumento(); // Obtener todos los tipos de documentos
                                        for (TipoDocumento tipoDoc : tipoDocs1) {
                                            for (Documento documento : documentos1) {
                                                if (tipoDoc.getId_tipodocumento() == documento.getId_tipodocumento()) {
                                        %>
                                                    <%= documento.getNumerodocumento() %>
                                        <%
                                                    break; 
                                                }
                                            }
                                        }
                                    %>                                 
                                </td>
                            </tr>
                        </tbody>
                </table>

                <div class="md:mx-auto flex justify-center py-12">

                    <a class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded" href="./empleado_index.jsp">Regresar al listado</a>

                </div>

            </section>

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
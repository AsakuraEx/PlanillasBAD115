<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

<%@page import="Models.Documento"%>
<%@page import="Controllers.DocumentoController"%>
<%@page import="Models.TipoDocumento"%>
<%@page import="Controllers.TipoDocumentoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Models.Departamento"%>
<%@page import="Controllers.DepartamentoController"%>
<%@page import="Models.Municipio"%>
<%@page import="Controllers.MunicipioController"%>
<%@page import="Models.Puesto"%>
<%@page import="Controllers.PuestoController"%>
<%@page import="Models.Profesion"%>
<%@page import="Controllers.ProfesionController"%>
<%@page import="Models.EstadoCivil"%>
<%@page import="Controllers.EstadoCivilController"%>
<%@page import="java.util.List"%>
<%@page import="Controllers.SexoController"%>
<%@page import="Models.Sexo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.EmpleadoController"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empleado</title>
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

        <%
            LocalDate fechanacimiento = LocalDate.now();
            fechanacimiento = fechanacimiento.minusYears(18).minusDays(1);
            
            int id = Integer.parseInt(request.getParameter("id"));
            Empleado empleado = new Empleado();
            EmpleadoController controller = new EmpleadoController();
            empleado = controller.search(id);
        %>

        <main class="bg-slate-100">

            <section class="container bg-white h-full min-h-full">

                <div class="container text-center py-8">
    
                    <h1 class="font-bold text-2xl md:text-3xl border-b-2 pb-4 border-[#80BF96] text-[#629c76]">Formulario de Actualizacion de Empleados</h1>
    
                </div>

                <form action="empleado_update.jsp" method="post" class="grid md:grid-cols-2 gap-2">
                    <div class="flex flex-col gap-2 px-4">
                        <label>Primer Nombre:</label>
                        <input type="hidden" name="id_empleado" value="<%=empleado.getId_empleado() %>">
                        <input type="hidden" name="fechaingresosistema" value="<%=empleado.getFechaingresosistema() %>">
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="primernombre" value="<%=empleado.getPrimernombre() %>" required>                
                    </div>

                    <div class="flex flex-col gap-2 px-4">
                        <label>Segundo Nombre:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="segundonombre" value="<%=empleado.getSegundonombre() %>">                
                    </div>            
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Primer Apellido:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="primerapellido" value="<%=empleado.getPrimerapellido() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Segundo Apellido:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="segundoapellido" value="<%=empleado.getSegundoapellido() %>">                
                    </div>
                                
                    <div class="flex flex-col gap-2 px-4">
                        <label>Apellido Casada:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="apellidocasada" value="<%=empleado.getApellidocasada() %>">                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Fecha de Nacimiento:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="date" name="fechanacimiento" min="1965-01-01" max="<%=fechanacimiento%>" value="<%=empleado.getFechanacimiento() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Salario:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="number" name="salario" min="360" step="0.01" value="<%=empleado.getSalario() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>NIT:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="nit" pattern="\d{4}-\d{6}-\d{3}-\d{1}" placeholder="####-######-###-#" value="<%=empleado.getNit() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>NUP:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="nup" pattern="\d{12}" placeholder="############" value="<%=empleado.getNup() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>ISSS:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="text" name="numeroisss" pattern="\d{9}" value="<%=empleado.getNumeroisss() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Correo Personal:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="email" name="correopersonal" value="<%=empleado.getCorreopersonal() %>" required>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Correo Institucional:</label>
                        <input class="border rounded-lg py-1 px-4 w-full" type="email" name="correoinstitucional" value="<%=empleado.getCorreoinstitucional() %>">                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Sexo:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_sexo" required>
                            <option value=""> </option>
                            <%
                                SexoController controllerSexo = new SexoController();
                                List<Sexo> sexos = controllerSexo.mostrarSexos();
                                String mensaje1;
                                for(Sexo sexo : sexos){
                                    if(empleado.getId_sexo()==sexo.getId_sexo()){
                                        mensaje1 = "selected";
                                    }else{
                                        mensaje1 = " ";
                                    }
                            %>
                            <option value="<%=sexo.getId_sexo() %>" <%=mensaje1 %> ><%= sexo.getNombreSexo() %></option>
                            <%
                                }
                            %>
                        </select>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Estado Civil:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_estadocivil" required>
                            <option value=""> </option>
                            <%
                                EstadoCivilController controllerEstado = new EstadoCivilController();
                                List<EstadoCivil> estados = controllerEstado.mostrarEstadoCivil();
                                String mensaje2;
                                for(EstadoCivil estado : estados){
                                    if(empleado.getId_estadocivil()==estado.getId_estadocivil()){
                                        mensaje2 = "selected";
                                    }else{
                                        mensaje2 = " ";
                                    }
                            %>
                            <option value="<%= estado.getId_estadocivil() %>" <%=mensaje2%>><%= estado.getNombreestadocivil() %></option>
                            <%
                                }
                            %>                    
                        </select>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Profesion:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_profesion" required>
                            <option value=""> </option>
                            <%
                                ProfesionController controllerProfesion = new ProfesionController();
                                List<Profesion> profesiones = controllerProfesion.mostrarProfesiones();
                                String mensaje3;
                                for(Profesion profesion : profesiones){
                                    if(Integer.parseInt(profesion.getHabilitado())== 1){
                                        if(empleado.getId_profesion()==profesion.getId_profesion()){
                                            mensaje3 = "selected";
                                        }else{
                                            mensaje3 = " ";
                                        }
                            %>
                            <option value="<%= profesion.getId_profesion() %>" <%=mensaje3%>><%= profesion.getNombreprofesion() %></option>
                            <%
                                    }
                                }
                            %>                    
                        </select>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Puesto:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_puesto" required>
                            <option value=""> </option>
                            <%
                                PuestoController controllerPuesto = new PuestoController();
                                List<Puesto> puestos = controllerPuesto.mostrarPuestos();
                                String mensaje4;
                                for(Puesto puesto : puestos){
                                    if(Integer.parseInt(puesto.getHabilitado())== 1){
                                        if(empleado.getId_puesto()==puesto.getId_puesto()){
                                            mensaje4 = "selected";
                                        }else{
                                            mensaje4 = " ";
                                        }
                            %>
                            <option value="<%= puesto.getId_puesto() %>" <%=mensaje4%>><%= puesto.getNombrepuesto() %></option>
                            <%
                                    }
                                }
                            %>                    
                        </select>                
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4">
                        <label>Municipio:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_municipio" required>
                            <option value=""> </option>
                            <%
                                MunicipioController controllerMunicipio = new MunicipioController();
                                List<Municipio> municipios = controllerMunicipio.mostrarMunicipios();
                                
                                DepartamentoController controllerDepartamento = new DepartamentoController();
                                String mensaje5;
                                for(Municipio municipio : municipios){
                                    Departamento departamento = controllerDepartamento.search(municipio.getId_departamento());
                                        if(empleado.getId_municipio()==municipio.getId_municipio()){
                                            mensaje5 = "selected";
                                        }else{
                                            mensaje5 = " ";
                                        }                            
                            %>
                            <option value="<%= municipio.getId_municipio() %>" <%=mensaje5%>><%= departamento.getNombredepartamento() %>  -- <%= municipio.getNombremunicipio() %></option>
                            <%
                                }
                            %>                    
                        </select>                
                    </div>
                        
                    <div class="flex flex-col gap-2 px-4">
                        <label for="id_tipodocumento">Tipo de Documento:</label>
                        <select class="border rounded-lg py-1 px-4 w-full" name="id_tipodocumento" required onchange="handleDocumentoFormat()">
                        <option value="">Seleccione un tipo de documento</option>
                        <% 
                        DocumentoController controllerDoc = new DocumentoController();
                        List<Documento> documentos = controllerDoc.mostrarDocumentos(empleado.getId_empleado());

                        TipoDocumentoController controllerTipodoc = new TipoDocumentoController();
                        List<TipoDocumento> tipoDocs = controllerTipodoc.mostrarTipoDocumento(); // Obtener todos los tipos de documentos

                        for (TipoDocumento tipoDoc : tipoDocs) {
                            boolean encontrado = false; // Variable para rastrear si se ha encontrado el tipo de documento del empleado
                            for (Documento documento : documentos) {
                                if (tipoDoc.getId_tipodocumento() == documento.getId_tipodocumento()) {
                                    encontrado = true; // Se ha encontrado el tipo de documento del empleado
                                    %>
                                    <option value="<%= documento.getId_tipodocumento() %>" selected>
                                        <%= tipoDoc.getNombretipodocumento() %>
                                    </option>
                                    <% 
                                    break; // Una vez que se ha seleccionado el tipo de documento del empleado, se sale del bucle interno
                                }
                            }
                            // Si el tipo de documento no se ha encontrado, lo agregamos como una opción no seleccionada
                            if (!encontrado) {
                                %>
                                <option value="<%= tipoDoc.getId_tipodocumento() %>">
                                    <%= tipoDoc.getNombretipodocumento() %>
                                </option>
                                <% 
                            }
                        } 
                        %>
                    </select>
                    </div>
                    
           
                    <div class="inline-flex px-4 items-center gap-3">
                        <label class="py-6">Habilitado:</label>
                        <%
                            String checked;
                            if(Integer.parseInt(empleado.getHabilitado())==1){
                                checked = "checked";
                            }else{
                                checked = " ";
                            }                    
                        %>
                        <input type="checkbox" name="habilitado" value="1" <%=checked %>>
                        <input type="hidden" name="habilitado" value="0">                
                    </div>
                          
                     <div class="flex flex-col gap-2 px-4">
                        <label for="id_tipodocumento">N° de documento:</label>
                        <%
                            DocumentoController controllerDoc1 = new DocumentoController();
                            List<Documento> documentos1 = controllerDoc1.mostrarDocumentos(empleado.getId_empleado());

                            TipoDocumentoController controllerTipodoc1 = new TipoDocumentoController();
                            List<TipoDocumento> tipoDocs1 = controllerTipodoc1.mostrarTipoDocumento(); 

                            for (TipoDocumento tipoDoc : tipoDocs1) {
                                for (Documento documento : documentos1) {
                                    if (tipoDoc.getId_tipodocumento() == documento.getId_tipodocumento()) {
                            %>
                                        <input type="text" class="border rounded-lg py-1 px-4 w-full" name="ndocumento" id="ndocumento" value="<%= documento.getNumerodocumento() %>" required>
                            <%
                                        break; // Una vez que se ha encontrado el documento, sal del bucle
                                    }
                                }
                            }
                        %>
                    </div>
                    
                    <div class="flex flex-col gap-2 px-4 md:col-span-2 md:flex-row md:mx-auto md:my-4">

                        <button class="bg-[#80BF96] hover:bg-[#629c76] py-2 px-4 text-center rounded-md font-bold text-white md:w-32" type="submit">Actualizar</button>
                    </div>
                </form>
                
                <div class="md:mx-auto flex justify-center py-12">

                    <a class="bg-gray-900 text-white hover:bg-gray-500 py-2 px-4 text-center rounded" href="./empleado_index.jsp">Regresar al listado</a>
        
                </div>

            </section>

        </main>

    </body>
</html>
<script>
function handleDocumentoFormat() {
    var select = document.getElementsByName("id_tipodocumento")[0];
    var input = document.getElementById("ndocumento");
    var selectedOption = select.options[select.selectedIndex].text;
    
    // Reset input value
    input.value = "";
    
    // Set format based on selectedOption
    switch (selectedOption) {
        case "Selecciona un tipo de documento...":
            input.placeholder = "Selecciona un tipo de documento";
            input.pattern = "[0-9]{8}-[0-9]";
            break;
        case "Documento Único Identidad":
            input.placeholder = "########-#";
            input.pattern = "[0-9]{8}-[0-9]";
            break;
        case "Pasaporte":
            input.placeholder = "L#######";
            input.pattern = "[A-Za-z][0-9]{7}";
            break;
        case "Carné Trabajo":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            break; 
        case "Otros":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            break; 
        case "Carné de Residencia":
            input.placeholder = "############";
            input.pattern = "[0-9]{12}";
            break;
        case "Ninguno":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            input.required = false; // Hacer que el campo no sea obligatorio
            break;
        case "Número de Identificación Tributaria":
            input.placeholder = "####-######-###-#";
            input.pattern = "\d{4}-\d{6}-\d{3}-\d{1}";
            break;
        default:
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+"; // Any character at least once
            break;
    }
}
</script>
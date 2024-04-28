<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

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
        <title>Crear Empleado</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="../index.jsp">Inicio</a></li>
                </ul>
            </nav>
            <hr>
        </header>

        <%
            LocalDate fechanacimiento = LocalDate.now();
            fechanacimiento = fechanacimiento.minusYears(18).minusDays(1);
        %>

        <h3>Formulario de Creacion de Nuevo Empleado</h3>
        <br>
        <form action="empleado_store.jsp" method="post">
            <div>
                <label>Primer Nombre:</label>
                <input type="text" name="primernombre" required>                
            </div>
            <br>
            <div>
                <label>Segundo Nombre:</label>
                <input type="text" name="segundonombre">                
            </div>            
            <br>
            <div>
                <label>Primer Apellido:</label>
                <input type="text" name="primerapellido" required>                
            </div>
            <br>
            <div>
                <label>Segundo Apellido:</label>
                <input type="text" name="segundoapellido">                
            </div>
            <br>            
            <div>
                <label>Apellido Casada:</label>
                <input type="text" name="apellidocasada">                
            </div>
            <br>
            <div>
                <label>Fecha de Nacimiento:</label>
                <input type="date" name="fechanacimiento" min="1965-01-01" max="<%=fechanacimiento%>" required>                
            </div>
            <br>
            <div>
                <label>Salario:</label>
                <input type="number" name="salario" min="360" step="0.01" required>                
            </div>
            <br>
            <div>
                <label>NIT:</label>
                <input type="text" name="nit" pattern="\d{4}-\d{6}-\d{3}-\d{1}" placeholder="####-######-###-#" required>                
            </div>
            <br>
            <div>
                <label>NUP:</label>
                <input type="text" name="nup" pattern="\d{12}" placeholder="############" required>                
            </div>
            <br>
            <div>
                <label>ISSS:</label>
                <input type="text" name="numeroisss" pattern="\d{9}" required>                
            </div>
            <br>
            <div>
                <label>Correo Personal:</label>
                <input type="email" name="correopersonal" required>                
            </div>
            <br>
            <div>
                <label>Correo Institucional:</label>
                <input type="email" name="correoinstitucional">                
            </div>
            <br>
            <div>
                <label>Sexo:</label>
                <select name="id_sexo" required>
                    <option value=""> </option>
                    <%
                        SexoController controllerSexo = new SexoController();
                        List<Sexo> sexos = controllerSexo.mostrarSexos();
                        
                        for(Sexo sexo : sexos){
                    %>
                    <option value="<%=sexo.getId_sexo() %>"><%= sexo.getNombreSexo() %></option>
                    <%
                        }
                    %>
                </select>                
            </div>
            <br>
            <div>
                <label>Estado Civil:</label>
                <select name="id_estadocivil" required>
                    <option value=""> </option>
                    <%
                        EstadoCivilController controllerEstado = new EstadoCivilController();
                        List<EstadoCivil> estados = controllerEstado.mostrarEstadoCivil();
                        
                        for(EstadoCivil estado : estados){
                    %>
                    <option value="<%= estado.getId_estadocivil() %>"><%= estado.getNombreestadocivil() %></option>
                    <%
                        }
                    %>                    
                </select>                
            </div>
            <br>
            <div>
                <label>Profesion:</label>
                <select name="id_profesion" required>
                    <option value=""> </option>
                    <%
                        ProfesionController controllerProfesion = new ProfesionController();
                        List<Profesion> profesiones = controllerProfesion.mostrarProfesiones();
                        
                        for(Profesion profesion : profesiones){
                            if(Integer.parseInt(profesion.getHabilitado())== 1){
                    %>
                    <option value="<%= profesion.getId_profesion() %>"><%= profesion.getNombreprofesion() %></option>
                    <%
                            }
                        }
                    %>                    
                </select>                
            </div>
            <br>
            <div>
                <label>Puesto:</label>
                <select name="id_puesto" required>
                    <option value=""> </option>
                    <%
                        PuestoController controllerPuesto = new PuestoController();
                        List<Puesto> puestos = controllerPuesto.mostrarPuestos();
                        
                        for(Puesto puesto : puestos){
                            if(Integer.parseInt(puesto.getHabilitado())== 1){
                    %>
                    <option value="<%= puesto.getId_puesto() %>"><%= puesto.getNombrepuesto() %></option>
                    <%
                            }
                        }
                    %>                    
                </select>                
            </div>
            <br>
            <div>
                <label>Municipio:</label>
                <select name="id_municipio" required>
                    <option value=""> </option>
                    <%
                        MunicipioController controllerMunicipio = new MunicipioController();
                        List<Municipio> municipios = controllerMunicipio.mostrarMunicipios();
                        
                        DepartamentoController controllerDepartamento = new DepartamentoController();
                        
                        for(Municipio municipio : municipios){
                            Departamento departamento = controllerDepartamento.search(municipio.getId_departamento());
                    %>
                    <option value="<%= municipio.getId_municipio() %>"><%= departamento.getNombredepartamento() %>  -- <%= municipio.getNombremunicipio() %></option>
                    <%
                        }
                    %>                    
                </select>                
            </div>
            <br>            
            <div>
                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">                
            </div>
            <br>            
            <button type="submit">Guardar</button>
            <button type="reset">Limpiar</button>
        </form>        
        
    </body>
</html>

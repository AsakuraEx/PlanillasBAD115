<%-- 
    Document   : unidadorganizativa_index
    Created on : 22 abr 2024, 8:13:32 p.m.
    Author     : frane
--%>

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
        <title>JSP Page</title>
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

        <h2>Detalle del Empleado</h2>
        <br>
        <table border>
            <thead>
                <td><strong> Campo </strong></td>
                <td><strong> Valor </strong></td>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Fecha de registro en el sistema</strong></td>
                    <td><%=empleado.getFechaingresosistema() %></td>
                </tr>
                <tr>
                    <td>Primer Nombre</td>
                    <td><%=empleado.getPrimernombre() %></td>
                </tr>
                <tr>
                    <td>Segundo Nombre</td>
                    <td><%=empleado.getSegundonombre() %></td>
                </tr>
                <tr>
                    <td>Primer Apellido</td>
                    <td><%=empleado.getPrimerapellido() %></td>
                </tr>
                <tr>
                    <td>Segundo Apellido</td>
                    <td><%=empleado.getSegundoapellido() %></td>
                </tr>
                <tr>
                    <td>Apellido Casada</td>
                    <td><%=empleado.getApellidocasada() %></td>
                </tr>
                <tr>
                    <td>Fecha de Nacimiento</td>
                    <td><%=empleado.getFechanacimiento() %></td>
                </tr>
                <tr>
                    <td>Salario</td>
                    <td>$ <%=empleado.getSalario() %></td>
                </tr>
                <tr>
                    <td>NIT</td>
                    <td><%=empleado.getNit() %></td>
                </tr>
                <tr>
                    <td>NUP</td>
                    <td><%=empleado.getNup() %></td>
                </tr>
                <tr>
                    <td>ISSS</td>
                    <td><%=empleado.getNumeroisss() %></td>
                </tr>
                <tr>
                    <td>Correo Personal</td>
                    <td><%=empleado.getCorreopersonal() %></td>
                </tr>
                <tr>
                    <td>Correo Institucional</td>
                    <td><%=empleado.getCorreoinstitucional() %></td>
                </tr>
                <tr>
                    <td>Sexo</td>
                    <td>
                        <%
                            SexoController sexoController = new SexoController();
                            Sexo sexo = new Sexo();
                            sexo = sexoController.search(empleado.getId_sexo());
                        %>
                        <%=sexo.getNombreSexo() %>
                    </td>
                </tr>
                <tr>
                    <td>Estado Civil</td>
                    <td>
                        <%
                            EstadoCivilController estadoController = new EstadoCivilController();
                            EstadoCivil estado = new EstadoCivil();
                            estado = estadoController.search(empleado.getId_estadocivil());
                        %>
                        <%=estado.getNombreestadocivil() %>
                    </td>
                </tr>
                <tr>
                    <td>Profesion</td>
                    <td>
                        <%
                            ProfesionController profesionController = new ProfesionController();
                            Profesion profesion = new Profesion();
                            profesion = profesionController.search(empleado.getId_profesion());
                        %>
                        <%=profesion.getNombreprofesion() %>
                    </td>
                </tr>
                <tr>
                    <td>Puesto</td>
                    <td>
                        <%
                            PuestoController puestoController = new PuestoController();
                            Puesto puesto = new Puesto();
                            puesto = puestoController.search(empleado.getId_puesto());
                        %>
                        <%=puesto.getNombrepuesto() %>
                    </td>
                </tr>
                <tr>
                    <td>Departamento</td>
                    <td>
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
                <tr>
                    <td>Municipio</td>
                    <td><%=municipio.getNombremunicipio() %></td>
                </tr>
                <tr>
                    <td>Tipo de documento</td>
                    <td><%=municipio.getNombremunicipio() %></td>
                </tr>
                <tr>
                    <td>N° de documento<td>
                    <td><%=municipio.getNombremunicipio() %></td>
                </tr>
            </tbody>
        </table>
                
        <br><br><br>
        <a href="empleado_index.jsp"><button>Regresar al listado</button></a>
    </body>
</html>

<%-- 
    Document   : empresa_index
    Created on : 18 abr 2024, 10:01:31 a.m.
    Author     : frane
--%>

<%@page import="java.util.List"%>
<%@page import="Models.Empresa"%>
<%@page import="Controllers.EmpresaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Empresas</title>
    </head>
    <body>
        
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="empresa_index.jsp">Empresas</a></li>
                    <li><a href="../unidadorganizativa/unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        
        <h1>Empresas Registradas</h1>
        
        <a href="empresa_create.jsp"><button>Crear nueva empresa</button></a>
        <br><br>
        
        <table border="1">
            <tr>
                <th>Nombre de la Empresa</th>
                <th>Correo</th>
                <th>Direccion</th>
                <th>NIC</th>
                <th>NIT</th>
                <th>Telefono</th>
                <th>Pagina Web</th>
                <th>Accion</th>
            </tr>
                <%
        
                    EmpresaController controller = new EmpresaController();
                    List<Empresa> empresas = controller.mostrarEmpresas();

                    for(Empresa empresa : empresas){
                %>
            <tr>

                <td><%= empresa.getNombreempresa() %></td>
                <td><%= empresa.getCorreoempresa() %></td>
                <td><%= empresa.getDireccion() %></td>
                <td><%= empresa.getNic() %></td>
                <td><%= empresa.getNit() %></td>
                <td><%= empresa.getTelefono() %></td>
                <td><%= empresa.getPaginaweb() %></td>
                <td>
                    <form action="empresa_edit.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= empresa.getId_empresa() %>">
                        <input type="submit" value="Editar">
                    </form>
                    <form action="empresa_delete.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= empresa.getId_empresa() %>">
                        <input type="hidden" name="habilitado" value="0">
                        <input type="submit" value="Eliminar">
                    </form>
                </td>
            </tr>
                <%
                    }
                %>
        </table>



    </body>
</html>

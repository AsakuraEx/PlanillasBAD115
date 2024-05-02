<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.TipoDocumentoController"%>
<%@page import="Models.TipoDocumento"%>
<%@page import="Controllers.DocumentoController"%>
<%@page import="Models.Documento"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.Locale" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Documentos</h1>
        <br>
        <a href="documento_create.jsp"><button>Crear nuevo documento</button></a>
        <br><br>
        <table border="1">
            <thead>
                <td>Empleado</td>
                <td>Tipo de documento</td>
                <td>N° de documento</td>
                <td>Estado</td>
                <td>Accion</td>
            </thead>
            <%
                EmpleadoController controllerEmpleado = new EmpleadoController();
                Empleado empleado = new Empleado();

                TipoDocumentoController controllerTipoDoc = new TipoDocumentoController();
                TipoDocumento tipodocumento = new TipoDocumento();
                
                DocumentoController controllerDocumento = new DocumentoController();    
                List<Documento> documentos = controllerDocumento.mostrarDocumentos();

                String mensaje;
            %>
            <tbody>
                <%
                    for(Documento doc : documentos){
                %>
                <tr>
                    <% 
                        empleado = controllerEmpleado.search(doc.getId_empleado());
                    %>
                    <td><%= empleado.getPrimernombre() %> </td>
                    <% 
                        tipodocumento = controllerTipoDoc.search(doc.getId_tipodocumento());
                    %>
                    <td><%= tipodocumento.getNombretipodocumento() %> </td>
                    <td><%= doc.getNumerodocumento() %> </td>
                    <% 
                        if(Integer.parseInt(doc.getHabilitado()) == 1){ 
                            mensaje = "Habilitado";
                        }else{ 
                            mensaje = "Deshabilitado";
                        }; 
                    %>
                    <td><%=mensaje %></td>
                    <td>
                        <form action="#" method="POST">
                            <input type="hidden" name="id" value="<%= doc.getId_documento() %>">
                            <input type="submit" value="Editar">
                        </form>                    
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>

<%@page import="java.util.List"%>
<%@page import="Models.TipoDescuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de tipos de descuentos</title>
    </head>
    <body>
        
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="../index.jsp">Inicio</a></li>
                    <li><a href="../empresa/empresa_index.jsp">Empresas</a></li>
                    <li><a href="tipodescuento_index.jsp">Tipos de Descuentos </a></li>
                </ul>
            </nav>
            <hr>
        </header>        
        
        <h1>Tipos de descuentos registrados</h1>
        
        
        <br><br>
        
        <table border="1">
            <tr>
                <th>Nombre del tipo de descuento</th>
                <th>Accion</th>
            </tr>
                <%
        
                    TipoDescuentoController controller = new TipoDescuentoController();
                    List<TipoDescuento> tiposdescuentos = controller.mostrarTipoDescuento();
                 
                    for(TipoDescuento tipodescuento : tiposdescuentos){                            
                %>
            <tr>

                <td><%= tipodescuento.getNombretipodesc() %></td>
                <td>
                    <form action="empresa_edit.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento() %>">
                        <input type="submit" value="Editar">
                    </form>
                    <form action="empresa_delete.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento() %>">
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

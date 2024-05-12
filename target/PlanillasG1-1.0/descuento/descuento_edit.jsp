<%-- 
    Document   : unidadorganizativa_create
    Created on : 22 abr 2024, 8:27:13 p.m.
    Author     : frane
--%>

<%@page import="Models.TipoDescuento"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="java.util.List"%>
<%@page import="Models.Descuento"%>
<%@page import="Controllers.DescuentoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DescuentoController controller = new DescuentoController();
    Descuento desc = controller.search(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unidades Organizativas</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="../empresa/empresa_index.jsp">Empresas</a></li>
                    <li><a href="unidadorganizativa_index.jsp">Unidades Organizativas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        
        <main>
            <h3>Crear unidad organizativa</h3>
            <br>
            <form action="descuento_update.jsp" method="post">
                <% 
                TipoDescuentoController controllerTipo = new TipoDescuentoController();
                TipoDescuento tipo1= new TipoDescuento();
                tipo1=controllerTipo.search(desc.getID_TIPODESCUENTO());
                %>
                
                <label>Nombre:</label>
                <input type="text" name="nombretipodesc" value="<%= tipo1.getNombretipodesc() %>" required>
                <input type="hidden" name="id" value="<%=desc.getID_DESCUENTO() %>">

                <label>Monto:</label>
                <input type="text" name="DESCUENTO" value="<%= desc.getDESCUENTO() %>" required>
                <% 
                    String checked;
                    if(Integer.parseInt(desc.getHabilitado()) == 1){
                        checked = "checked";
                    }else{
                        checked = " ";
                    } 
                %>
                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1" <%=checked %>>
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>

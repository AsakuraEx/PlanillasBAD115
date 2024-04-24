<%@page import="Models.TipoDescuento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.TipoDescuentoController"  %>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    TipoDescuentoController controller = new TipoDescuentoController();
    TipoDescuento tipodescuento = controller.search(id);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar tipo de descuento</title>
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
        

        <h3>Formulario de Edicion de tipo de descuento</h3>
        <br>
        <form action="tipodescuento_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= tipodescuento.getId_tipodescuento() %>"
            
            <label>Nombre de tipo de descuento:</label>
            <input type="text" name="nombretipodesc" value="<%= tipodescuento.getNombretipodesc() %>" required>
            
            <% 
                    String checked;
                    if(Integer.parseInt(tipodescuento.getHabilitado()) == 1){
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
        
    </body>
</html>

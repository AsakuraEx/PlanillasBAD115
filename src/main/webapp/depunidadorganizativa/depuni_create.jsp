<%-- 
    Document   : depuni_create
    Created on : 25 abr 2024, 8:38:43 p. m.
    Author     : Juanjo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.Unidadorganizativa"%>
<%@page import="Controllers.UnidadorgController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h3>Crear dep de la unidad organizativa</h3>
            <br>
            <form action="depuni_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombredeporg" required>

                <label>Empresa:</label>
                <select name="id_unidadorg" required>
                    <option value="">Selecciona una unidad organizativa...</option>
                    <% 
                        UnidadorgController controller = new UnidadorgController();
                        List<Unidadorganizativa> unidadorganizativas = controller.mostrarUnidades();
                        
                        for(Unidadorganizativa unidadorganizativa : unidadorganizativas){
                            if(unidadorganizativa.getHabilitado() != "1"){
                    %>
                    <option value="<%= unidadorganizativa.getId_unidadorg()%>"><%= unidadorganizativa.getNombreunidadorg()%></option>
                    <% 
                            }
                        }
                    %>
                </select>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>

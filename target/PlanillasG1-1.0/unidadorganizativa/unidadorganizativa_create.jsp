<%-- 
    Document   : unidadorganizativa_create
    Created on : 22 abr 2024, 8:27:13 p.m.
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
            <form action="unidadorganizativa_store.jsp" method="post">
                <label>Nombre:</label>
                <input type="text" name="nombreunidadorg" required>

                <label>Empresa:</label>
                <select name="id_empresa" required>
                    <option value="">Selecciona una empresa...</option>
                    <% 
                        EmpresaController controller = new EmpresaController();
                        List<Empresa> empresas = controller.mostrarEmpresas();
                        
                        for(Empresa empresa : empresas){
                            if(empresa.getHabilitado() != "1"){
                    %>
                    <option value="<%= empresa.getId_empresa() %>"><%= empresa.getNombreempresa() %></option>
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

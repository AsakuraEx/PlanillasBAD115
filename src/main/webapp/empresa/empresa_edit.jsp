<%-- 
    Document   : create_empresa
    Created on : 18 abr 2024, 7:27:48 a.m.
    Author     : frane
--%>

<%@page import="Models.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controllers.EmpresaController"  %>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    EmpresaController controller = new EmpresaController();
    Empresa empresa = controller.search(id);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empresa</title>
    </head>
    <body>
        <header>
            <h1>Sistema de Planillas (SIP)</h1>
            <h2>Menu:</h2>
            <nav>
                <ul>
                    <li><a href="../index.jsp">Inicio</a></li>
                    <li><a href="empresa_index.jsp">Empresas</a></li>
                </ul>
            </nav>
            <hr>
        </header>
        

        <h3>Formulario de Edicion de Empresa</h3>
        <br>
        <form action="empresa_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= empresa.getId_empresa() %>"
            
            <label>Nombre de Empresa:</label>
            <input type="text" name="nombreempresa" value="<%= empresa.getNombreempresa() %>" required>
            
            <label>Correo:</label>
            <input type="email" name="correoempresa" value="<%= empresa.getCorreoempresa() %>">

            <label>Direccion:</label>
            <input type="text" name="direccion" value="<%= empresa.getDireccion() %>">
            
            <label>NIC:</label>
            <input type="text" name="nic" value="<%= empresa.getNic() %>">
            
            <label>NIT:</label>
            <input type="text" name="nit" pattern="\d{4}-\d{6}-\d{3}-\d{1}" value="<%= empresa.getNit() %>" placeholder="####-######-###-#">
            
            <label>Telefono:</label>
            <input type="text" name="telefono" pattern="\d{4}-\d{4}" placeholder="####-####" value="<%= empresa.getTelefono() %>">
            
            <label>Pagina Web:</label>
            <input type="text" name="paginaweb" value="<%= empresa.getPaginaweb() %>">
            
            <button type="submit">Actualizar</button>
        </form>        
        
    </body>
</html>

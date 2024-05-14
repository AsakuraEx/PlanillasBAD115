<%-- 
    Document   : create_tipoingreso
    Created on : 23 abr 2024, 8:27:48 a.m.
    Author     : Juanjo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.TipoIngreso"%>
<%@page import="Controllers.TipoIngresoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Tipos de Ingreso</title>
</head>
<body>
    
    <header>
        <h1>Sistema de Gestión de Ingresos</h1>
        <h2>Menú:</h2>
        <nav>
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="tipoingreso_index.jsp">Tipos de Ingreso</a></li>
            </ul>
        </nav>
        <hr>
    </header>        
    
    <h1>Listado de Tipos de Ingreso</h1>
    
    <a href="tipoingreso_create.jsp"><button>Crear Nuevo Tipo de Ingreso</button></a>
    <br><br>
    
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Estado</th>
            <th>Acción</th>
        </tr>
            <%
    
                TipoIngresoController controller = new TipoIngresoController();
                List<TipoIngreso> ingresos = controller.mostrarTipoIngreso();
                String m1;
                for(TipoIngreso ingreso : ingresos){
            %>
        <tr>
            <td><%=ingreso.getNombretipoingreso() %></td>
                <%
                    if (Integer.parseInt(ingreso.getHabilitado()) == 1) {
                        m1 = "Habilitado";
                    } else {
                        m1 = "Deshabilitado";
                    };
                %>
                <td><%=m1%></td>
            <td>
                <form action="tipoingreso_edit.jsp" method="POST">
                    <input type="hidden" name="id" value="<%=ingreso.getId_tipoingreso() %>">
                    <input type="submit" value="Editar">
                </form>
                <form action="tipoingreso_delete.jsp" method="POST">
                    <input type="hidden" name="id" value="<%=ingreso.getId_tipoingreso() %>">
                    <input type="hidden" name="habilitado" value="0">
                </form>
            </td>
        </tr>
            <%
                }
            %>
    </table>
</body>
</html>



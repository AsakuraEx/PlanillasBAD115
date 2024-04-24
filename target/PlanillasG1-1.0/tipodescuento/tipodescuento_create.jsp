<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear tipo de descuento</title>
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
        

        <h3>Formulario de Creación de Tipo Descuento</h3>
        <br>
        <form action="tipodescuento_store.jsp" method="post">
            <label>Nombre de tipo de descuento:</label>
            <input type="text" name="nombretipodesc" required>
            
            <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                          
            <button type="submit">Guardar</button>
        </form>     
    </body>
</html>

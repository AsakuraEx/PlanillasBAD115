<%@page import="java.util.List"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.TipoDocumento"%>
<%@page import="Controllers.TipoDocumentoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documentos</title>
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
        
        <main>
            <h3>Crear documento</h3>
            <br>
            <form action="documento_store.jsp" method="post">               
                <label>Empleado:</label>
                <select name="id_empleado" required>
                    <option value="">Selecciona un empleado...</option>
                    <% 
                        EmpleadoController controller = new EmpleadoController();
                        List<Empleado> empleados = controller.mostrarEmpleados();
                        
                        for(Empleado empleado : empleados){
                            if(Integer.parseInt(empleado.getHabilitado()) == 1){
                    %>
                    <option value="<%= empleado.getId_empleado() %>"><%= empleado.getPrimernombre() %></option>
                    <% 
                            }
                        }
                    %>
                </select>
                <select name="id_tipodocumento" required onchange="handleDocumentoFormat()">
                    <option value="">Selecciona un tipo de documento...</option>
                    <% 
                        TipoDocumentoController controllerTipo = new TipoDocumentoController();
                        List<TipoDocumento> tiposdocumentos = controllerTipo.mostrarTipoDocumento();
                        
                        for(TipoDocumento tipodoc : tiposdocumentos){
                            if(Integer.parseInt(tipodoc.getHabilitado()) == 1){
                    %>
                    <option value="<%= tipodoc.getId_tipodocumento() %>"><%= tipodoc.getNombretipodocumento() %></option>
                    <% 
                            }
                        }
                    %>
                </select>
                <label>N° de documento</label>
                <input type="text" name="ndocumento" id="ndocumento" required>

                <label>Habilitado:</label>
                <input type="checkbox" name="habilitado" value="1">
                <input type="hidden" name="habilitado" value="0">
                
                <button type="submit">Guardar</button>
            </form>
            
        </main>
    </body>
</html>

<script>
function handleDocumentoFormat() {
    var select = document.getElementsByName("id_tipodocumento")[0];
    var input = document.getElementById("ndocumento");
    var selectedOption = select.options[select.selectedIndex].text;
    
    // Reset input value
    input.value = "";
    
    // Set format based on selectedOption
    switch (selectedOption) {
        case "Selecciona un tipo de documento...":
            input.placeholder = "Selecciona un tipo de documento";
            input.pattern = "[0-9]{8}-[0-9]";
            break;
        case "Documento Único Identidad":
            input.placeholder = "########-#";
            input.pattern = "[0-9]{8}-[0-9]";
            break;
        case "Pasaporte":
            input.placeholder = "L#######";
            input.pattern = "[A-Za-z][0-9]{7}";
            break;
        case "Carné Trabajo":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            break; 
        case "Otros":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            break; 
        case "Carné de Residencia":
            input.placeholder = "############";
            input.pattern = "[0-9]{12}";
            break;
        case "Ninguno":
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+";
            input.required = false; // Hacer que el campo no sea obligatorio
            break;
        case "Número de Identificación Tributaria":
            input.placeholder = "####-######-###-#";
            input.pattern = "\d{4}-\d{6}-\d{3}-\d{1}";
            break;
        default:
            input.placeholder = "Ingrese el número de documento";
            input.pattern = ".+"; // Any character at least once
            break;
    }
}
</script>
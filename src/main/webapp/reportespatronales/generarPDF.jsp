<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="java.io.*"%>
<%@page import="Controllers.EmpleadoController"%>
<%@page import="Models.Empleado"%>
<%@page import="Controllers.TipoDescuentoController"%>
<%@page import="Models.TipoDescuento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Crear el documento PDF
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter.getInstance(document, baos);
    document.open();
    
    // Obtener la fecha y hora actual
    Date fechaActual = new Date();

    // Formatear la fecha y hora
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String fechaFormateada = sdf.format(fechaActual);

    // Obtener la ruta real de la carpeta assets
    String imagePath = request.getServletContext().getRealPath("/assets/logoBAD.png");
    Image image = Image.getInstance(imagePath);

    // Escalar la imagen al tamaño deseado (por ejemplo, 100x100)
    image.scaleAbsolute(100, 100);

    // Centrar la imagen en el documento
    image.setAlignment(Image.ALIGN_CENTER);

    // Agregar la imagen al documento
    document.add(image);

    // Crear un Chunk con el texto y aplicarle un color azul oscuro
    Chunk chunk = new Chunk("Reporte de Aportes Patronales correspondiente a Junio de 2024");
    chunk.setFont(FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE.darker()));

    // Crear un Paragraph y agregar el Chunk
    Paragraph paragraph = new Paragraph(chunk);
    paragraph.setAlignment(Element.ALIGN_CENTER);

    // Agregar el Paragraph al documento
    document.add(paragraph);
    document.add(new Paragraph(" "));
    

    PdfPTable table = new PdfPTable(7);
    table.setWidthPercentage(100);
    table.addCell("Empleado");
    table.addCell("Salario");
    table.addCell("Otros ingresos");
    table.addCell("Monto cotizable");
    table.addCell("ISSS Patronal");
    table.addCell("AFP Patronal");
    table.addCell("Total de aportes");

    EmpleadoController controllerEmpleado = new EmpleadoController();
    List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();       
    TipoDescuentoController tipoController = new TipoDescuentoController();
    List<TipoDescuento> tipos = tipoController.descFiltrados();
    
    for (Empleado empleado : empleados) {
        double isssPatronal = 0.0;
        double afpPatronal = 0.0;
        EmpleadoController controllerEmp = new EmpleadoController();
        double totalIng = controllerEmp.sumarIngresosEmpleado(empleado.getId_empleado());   
        double sumaTotalIng = empleado.getSalario() + totalIng;
        for (TipoDescuento t : tipos) {
            double aporte = sumaTotalIng * (t.getPorcentaje() / 100.0);
            String nombreTipoDesc = t.getNombretipodesc().trim();
            if ("ISSS Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                isssPatronal = aporte;
            } else if ("AFP Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                afpPatronal = aporte;
            }
        }
        double totalAportes = isssPatronal + afpPatronal;

        table.addCell(empleado.getPrimernombre() + " " + 
                      (empleado.getSegundonombre() != null ? empleado.getSegundonombre() + " " : "") +
                      empleado.getPrimerapellido() + " " +
                      (empleado.getSegundoapellido() != null ? empleado.getSegundoapellido() + " " : "") +
                      (empleado.getApellidocasada() != null ? empleado.getApellidocasada() : ""));
        table.addCell("$ " + empleado.getSalario());
        table.addCell("$ " + totalIng);
        table.addCell("$ " + sumaTotalIng);
        table.addCell("$ " + String.format("%.2f", isssPatronal));
        table.addCell("$ " + String.format("%.2f", afpPatronal));
        table.addCell("$ " + String.format("%.2f", totalAportes));
    }
    

    document.add(table);
    document.add(new Paragraph(" "));
    // Agregar la fecha y hora al PDF
    document.add(new Paragraph("Fecha y hora de generación del reporte: " + fechaFormateada));
    document.close();

    // Enviar el PDF al navegador
    response.setHeader("Expires", "0");
    response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
    response.setHeader("Pragma", "public");
    response.setContentType("application/pdf");
    response.setContentLength(baos.size());

    OutputStream os = response.getOutputStream();
    baos.writeTo(os);
    os.flush();
%>

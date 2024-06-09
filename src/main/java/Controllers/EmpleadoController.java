/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Descuento;
import Models.Empleado;
import Models.Ingreso;
import Models.TipoDescuento;
import Models.Presupuesto;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import java.sql.Date;
/**
 *
 * @author frane
 */
public class EmpleadoController {
    
    public Empleado create(String primernombre, String segundonombre, String primerapellido, String segundoapellido, String apellidocasada, LocalDate fechanacimiento, double salario, String correopersonal, String correoinstitucional, int id_sexo, int id_estadocivil, int id_profesion, int id_puesto, int id_municipio, String habilitado, String nup, String nit, String numeroisss){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
     
            Empleado empleado = new Empleado();
            empleado.setPrimernombre(primernombre);
            empleado.setSegundonombre(segundonombre);
            empleado.setPrimerapellido(primerapellido);
            empleado.setSegundoapellido(segundoapellido);
            empleado.setApellidocasada(apellidocasada);
            empleado.setFechanacimiento(fechanacimiento);
            
            //FECHA INGRESO AL SISTEMA = FECHA DEL DIA ACTUAL
            LocalDate fechaingreso = LocalDate.now();
            empleado.setFechaingresosistema(fechaingreso);
            
            empleado.setSalario(salario);
            empleado.setCorreopersonal(correopersonal);
            empleado.setCorreoinstitucional(correoinstitucional);
            empleado.setId_sexo(id_sexo);
            empleado.setId_estadocivil(id_estadocivil);
            empleado.setId_profesion(id_profesion);
            empleado.setId_puesto(id_puesto);
            empleado.setId_municipio(id_municipio);
            empleado.setHabilitado(habilitado);
            
            empleado.setNup(nup);
            empleado.setNit(nit);
            empleado.setNumeroisss(numeroisss);
            
            System.out.print(empleado.toString());
                        
            session.beginTransaction();
            session.save(empleado);
            session.getTransaction().commit();
            sessionFactory.close();
           
            return empleado;

        
    }
    
    
    public List<Empleado> todosEmpleados(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<Empleado> empleados = null;
        
        try{
            session.beginTransaction();
            Query<Empleado> query = session.createQuery("FROM Empleado'", Empleado.class);
            empleados = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            sessionFactory.close();

        }
        return empleados;
    }
    
    public List<Empleado> mostrarEmpleados(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<Empleado> empleados = null;
        
        try{
            session.beginTransaction();
            Query<Empleado> query = session.createQuery("FROM Empleado WHERE habilitado='1'", Empleado.class);
            empleados = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            sessionFactory.close();

        }
        return empleados;
    }

    public Empleado search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Empleado empleado = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            empleado = session.get(Empleado.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        
        return empleado;
    }

        public void delete(Empleado empleado){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empleado);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }    

    public Empleado update(Empleado empleado){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empleado);
            session.getTransaction().commit();
            // Cargar el objeto actualizado desde la base de datos
            Empleado empleadoActualizado = session.get(Empleado.class, empleado.getId_empleado());
            sessionFactory.close();
            return empleadoActualizado; // Devuelve el objeto actualizado
           
        }catch(Exception e){
            e.printStackTrace();
             return null; // 
        }       
    }
    public double sumarDescuentosEmpleado(int idEmpleado,int mes,int año) {
            double sumaDescuentos1 = 0.0;
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
            Session session = sessionFactory.openSession();
            List<Descuento> descuentos = null;

            try {
                session.beginTransaction();
                //Query query = session.createQuery("from Descuento where ID_EMPLEADO = :idEmpleado and habilitado = 1 AND MONTH(fechadescuento) = :mes AND YEAR(fechadescuento) = :año");
                //query.setParameter("idEmpleado", idEmpleado);
                //query.setParameter("mes", mes);
                //query.setParameter("año", año);
                // Crear la fecha al inicio del mes
                LocalDate finMes = LocalDate.of(año, mes, 1).withDayOfMonth(LocalDate.of(año, mes, 1).lengthOfMonth());
                Date fechaFinMes = Date.valueOf(finMes);

            // Crear la consulta HQL
            String hql = "from Descuento where ID_EMPLEADO = :idEmpleado and habilitado = 1 " +
                         "and :fechaFinMes between fechaDescuento and fechaDescuentoFin";
            Query query = session.createQuery(hql);
                        // Configurar los parámetros de la consulta
            query.setParameter("idEmpleado", idEmpleado);
            query.setParameter("fechaFinMes", fechaFinMes);
                descuentos = query.list(); // Obtener la lista de descuentos
                session.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                session.close();
                sessionFactory.close();
            }
            if(descuentos!=null){
             for (Descuento descuento : descuentos) {
            sumaDescuentos1 += descuento.getDESCUENTO();
            }}else{
            sumaDescuentos1=0;
            }
           
        return sumaDescuentos1;
    }
        public double AFPEmpleado(int idEmpleado) {
            double sumaDescuentos1 = 0.0;
            
            TipoDescuentoController p =new TipoDescuentoController();
            TipoDescuento descuentos1 = null;
            descuentos1=p.mostrarTipoDescuentoAFP();
            EmpleadoController emple2 =new EmpleadoController();
            Empleado emp2 = emple2.search(idEmpleado);
    

            float descuento;
            descuento = (float) (emp2.getSalario()+sumarIngresosEmpleado(idEmpleado)) * descuentos1.getPorcentaje() / 100;
            Descuento DescuentoAFP = new Descuento(
                1000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                LocalDate.now(),
                descuento,              // descuento
                descuentos1.getId_tipodescuento(),                      // id_tipodescuento
                idEmpleado,               // id_empleado
                "1"                     // habilitado
            );
            sumaDescuentos1=DescuentoAFP.getDESCUENTO();
        return sumaDescuentos1;
    }
        public double ISSSEmpleado(int idEmpleado) {
            double sumaDescuentos1 = 0.0;
            
            TipoDescuentoController p =new TipoDescuentoController();
            TipoDescuento descuentos1 = null;
            descuentos1=p.mostrarTipoDescuentoISSS();
            EmpleadoController emple2 =new EmpleadoController();
            Empleado emp2 = emple2.search(idEmpleado);
    

            float descuento;
            if ((emp2.getSalario()+sumarIngresosEmpleado(idEmpleado))>1000) {
                    descuento = 30;
                } else {
                    descuento = (float) (emp2.getSalario()+sumarIngresosEmpleado(idEmpleado)) * descuentos1.getPorcentaje() / 100;
                }
            Descuento DescuentoISSS = new Descuento(
                1000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                LocalDate.now(),
                descuento,              // descuento
                descuentos1.getId_tipodescuento(),                      // id_tipodescuento
                idEmpleado,               // id_empleado
                "1"                     // habilitado
            );
            sumaDescuentos1=DescuentoISSS.getDESCUENTO();
        return sumaDescuentos1;
    }
        public double RENTAEmpleado(int idEmpleado) {
            double sumaDescuentos1 = 0.0;
            
            TipoDescuentoController p =new TipoDescuentoController();
            TipoDescuento descuentos1 = null;
            descuentos1=p.mostrarTipoDescuentoRenta();
            EmpleadoController emple2 =new EmpleadoController();
            Empleado emp2 = emple2.search(idEmpleado);
       
            Descuento DescuentoRENTA = new Descuento(
                1000000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                LocalDate.now(),
                (float)calcularRenta(emp2.getSalario()+sumarIngresosEmpleado(idEmpleado)),              // descuento
                descuentos1.getId_tipodescuento(),                      // id_tipodescuento
                idEmpleado,               // id_empleado
                "1"                     // habilitado
            );
            sumaDescuentos1=DescuentoRENTA.getDESCUENTO();
        return sumaDescuentos1;
    }

        public double salarioNetoEmpleado(int idEmpleado,int mes,int año) {
            double sumaDescuentos1 = 0.0;
            
            TipoDescuentoController p =new TipoDescuentoController();
            TipoDescuento descuentos1 = null;
            descuentos1=p.mostrarTipoDescuentoRenta();
            EmpleadoController emple2 =new EmpleadoController();
            Empleado emp2 = emple2.search(idEmpleado);
            sumaDescuentos1=emp2.getSalario()-emple2.RENTAEmpleado(idEmpleado)-emple2.ISSSEmpleado(idEmpleado)-emple2.AFPEmpleado(idEmpleado)-emple2.sumarDescuentosEmpleado(idEmpleado, mes, año)+emple2.sumarIngresosEmpleado2(idEmpleado, mes, año);
        return sumaDescuentos1;
    }
    public double sumarIngresosEmpleado(int idEmpleado) {
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        Session session = sessionFactory.openSession();
        double sumaIngresos = 0.0;

        try {
            session.beginTransaction();
            Query query = session.createQuery("select sum(ingreso) from Ingreso where id_empleado = :idEmpleado and habilitado = 1");
            query.setParameter("idEmpleado", idEmpleado);
            sumaIngresos = (Double) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }

        return sumaIngresos;
    }
    public double sumarIngresosEmpleado2(int idEmpleado, int mes,int año) {
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        Session session = sessionFactory.openSession();
        double sumaIngresos = 0.0;

        try {
            session.beginTransaction();
            Query query = session.createQuery("select sum(ingreso) from Ingreso where id_empleado = :idEmpleado and habilitado = 1 AND MONTH(FECHAINGRESO) = :mes AND YEAR(FECHAINGRESO) = :año");
            query.setParameter("idEmpleado", idEmpleado);
            query.setParameter("mes", mes);
            query.setParameter("año", año);
            sumaIngresos = (Double) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }
        return sumaIngresos;
    }
    
    public double presupuestoNeto(int mes, int año) {
    double PresupuestoRestante = 0.0;
    EmpleadoController controllerEmpleado = new EmpleadoController();
    List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();
    
    PresupuestoController controller = new PresupuestoController();
    Presupuesto presupuesto = controller.search(182);
    
    // Inicializar PresupuestoRestante con el monto del presupuesto
    PresupuestoRestante = presupuesto.getMonto();
    
    // Restar los salarios y bonos de los empleados del presupuesto
    for (Empleado empleado : empleados) {
        double salario = empleado.getSalario();
        double ingresos = sumarIngresosEmpleado2(empleado.getId_empleado(),mes,año);

        PresupuestoRestante -= (salario + ingresos);
    }
    double patronales = sumarDescuentosPatronales();
    PresupuestoRestante =PresupuestoRestante -patronales;
    return PresupuestoRestante;
}

       private double calcularRenta(double salario) {
        if ((salario) <= 472.00) {
            return 0.0;
        } else if (salario <= 895.24) {
            return (salario - 472.00) * 0.10+17.67;
        } else if (salario <= 2038.10) {
            return (salario - 895.24) * 0.20+60.00;
        } else {
            return 288.57 + (salario - 2038.10) * 0.30;
        }
    }

    public double sumarDescuentosPatronales() {
            EmpleadoController controllerEmpleado = new EmpleadoController();
            List<Empleado> empleados = controllerEmpleado.mostrarEmpleados();       
            TipoDescuentoController tipoController = new TipoDescuentoController();
            List<TipoDescuento> tipos = tipoController.descFiltrados();
            double isssP = 0.0;
            double afpPl = 0.0;
            double sumaTotalAportes = 0.0;
                                
            for (Empleado empleado : empleados) {
                double isssPatronal = 0.0;
                double afpPatronal = 0.0;
                EmpleadoController controllerEmp = new EmpleadoController();
                double totalIng = controllerEmp.sumarIngresosEmpleado(empleado.getId_empleado());   
                double sumaTotalIng = empleado.getSalario() + totalIng;
                for (TipoDescuento t : tipos) {
                    double aporte = sumaTotalIng * (t.getPorcentaje() / 100.0);
                    double valorPorcentaje = t.getPorcentaje();
                    String nombreTipoDesc = t.getNombretipodesc().trim();
                    if ("ISSS Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                        isssPatronal = aporte;
                        isssP = valorPorcentaje;
                    } else if ("AFP Patronal".equalsIgnoreCase(nombreTipoDesc)) {
                        afpPatronal = aporte;
                        afpPl = valorPorcentaje;
                    }
                }
                double totalAportes = isssPatronal + afpPatronal;
                sumaTotalAportes += totalAportes;
            }
        return sumaTotalAportes;
    }

}



 
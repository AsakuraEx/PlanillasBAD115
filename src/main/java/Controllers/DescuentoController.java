/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;


import Models.Descuento;
import Models.TipoDescuento;
import Controllers.TipoDescuentoController;
import Models.Empleado;
import Controllers.EmpleadoController;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import java.util.Date;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;


/**
 *
 * @author Juanjo
 */
public class DescuentoController {
        
    public void create(int id_empleado, int id_tipodescuento, float descuento,  String habilitado, String fechaDescuento, String fechaDescuentoFin){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
          // Convertir la fecha de String a Date
    LocalDate fechaDescuento1 = null;
    LocalDate fechaDescuento2 = null;
    try {
        fechaDescuento1 = LocalDate.parse(fechaDescuento, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        fechaDescuento2 = LocalDate.parse(fechaDescuentoFin, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    } catch (DateTimeParseException e) {
        e.printStackTrace();
    }                           
        try{
            Descuento desc = new Descuento();
            desc.setID_EMPLEADO(id_empleado);
            desc.setID_TIPODESCUENTO(id_tipodescuento);
            desc.setDESCUENTO(descuento);
            desc.setHabilitado(habilitado);
            desc.setFECHADESCUENTO(fechaDescuento1);
            desc.setFECHADESCUENTOFIN(fechaDescuento2);
                                
            session.beginTransaction();
            session.save(desc);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
    
    public List<Descuento> mostrarDescuentos(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Descuento> descuentos = null;

            try{
                session.beginTransaction();
                Query<Descuento> query = session.createQuery("FROM Descuento", Descuento.class);
                descuentos = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return descuentos;
    }
    
    public Descuento search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Descuento unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(Descuento.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        
        return unidad;
    }    

    public void update(Descuento descuento){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(descuento);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }
    
public List<Descuento> mostrarDescuentosPorEmpleado(int empleado) {
    LocalDate fecha = LocalDate.now();
    //LocalDate fechaMesAnterior = fecha.minusMonths(1);
    SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
    Session session = sessionFactory.openSession();
    List<Descuento> descuentos = null;

    try {
        session.beginTransaction();
        Query<Descuento> query = session.createQuery("FROM Descuento WHERE ID_EMPLEADO = :empleado AND FECHADESCUENTO <= :fecha AND FECHADESCUENTOFIN >= :fecha", Descuento.class);
        query.setParameter("empleado", empleado);
        query.setParameter("fecha", fecha);
        descuentos = query.getResultList();
        session.getTransaction().commit();
    } catch(Exception e) {
        e.printStackTrace();
        
    } finally {
        session.close();
        sessionFactory.close();
    }
    
    
    TipoDescuentoController p =new TipoDescuentoController();
    List<TipoDescuento> descuentos1 = null;
    descuentos1=p.mostrarTipoDescuentoley();
    int j = descuentos1.size();
    
    EmpleadoController emple =new EmpleadoController();
    Empleado emp1 = emple.search(empleado);
    

                for (int i = 0; i <= j-1; i++) {
                float descuento;
                
                if (descuentos1.get(i).getNombretipodesc().equals("ISSS")) {
                    if((emp1.getSalario()+emple.sumarIngresosEmpleado(empleado))>1000){
                        descuento = 30;
                    }else{descuento = (float) (emp1.getSalario()+emple.sumarIngresosEmpleado(empleado)) * descuentos1.get(i).getPorcentaje() / 100;}
                    
                } else {
                    descuento = (float) (emp1.getSalario()+emple.sumarIngresosEmpleado(empleado)) * descuentos1.get(i).getPorcentaje() / 100;
                }
            Descuento tempDescuento = new Descuento(
                i+1000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                LocalDate.now(),
                descuento,              // descuento
                descuentos1.get(i).getId_tipodescuento(),                      // id_tipodescuento
                empleado,               // id_empleado
                "1"                     // habilitado
            );
            descuentos.add(tempDescuento);
        }
        TipoDescuento descuentos2 = null;
        descuentos2=p.mostrarTipoDescuentoRenta();        
        Descuento tempDescuento = new Descuento(
                1000000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                LocalDate.now(),
                (float)calcularRenta(emp1.getSalario()+emple.sumarIngresosEmpleado(empleado)),              // descuento
                descuentos2.getId_tipodescuento(),                      // id_tipodescuento
                empleado,               // id_empleado
                "1"                     // habilitado
            );
            descuentos.add(tempDescuento);
                
    return descuentos;
}

 private double calcularRenta(double salario) {
        if (salario <= 472.00) {
            return 0.0;
        } else if (salario <= 895.24) {
            return (salario - 472.00) * 0.10+17.67;
        } else if (salario <= 2038.10) {
            return (salario - 895.24) * 0.20+60.00;
        } else {
            return 288.57 + (salario - 2038.10) * 0.30;
        }
    }
   
}

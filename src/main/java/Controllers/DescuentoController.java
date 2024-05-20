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

/**
 *
 * @author Juanjo
 */
public class DescuentoController {
        
    public void create(int id_empleado, int id_tipodescuento, float descuento,  String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            Descuento desc = new Descuento();
            desc.setID_EMPLEADO(id_empleado);
            desc.setID_TIPODESCUENTO(id_tipodescuento);
            desc.setDESCUENTO(descuento);
            desc.setHabilitado(habilitado);
            desc.setFECHADESCUENTO(LocalDate.now());
                                
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
    SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
    Session session = sessionFactory.openSession();
    List<Descuento> descuentos = null;

    try {
        session.beginTransaction();
        Query<Descuento> query = session.createQuery("FROM Descuento WHERE ID_EMPLEADO = :empleado", Descuento.class);
        query.setParameter("empleado", empleado);
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
                    descuento = 30;
                } else {
                    descuento = (float) emp1.getSalario() * descuentos1.get(i).getPorcentaje() / 100;
                }
            Descuento tempDescuento = new Descuento(
                i+1000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                descuento,              // descuento
                descuentos1.get(i).getId_tipodescuento(),                      // id_tipodescuento
                empleado,               // id_empleado
                "1"                     // habilitado
            );
            descuentos.add(tempDescuento);
        }
    return descuentos;
}
   
}

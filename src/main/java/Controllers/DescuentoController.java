/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;


import Models.Descuento;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

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
            desc.setId_empleado(id_empleado);
            desc.setId_tipodescuento(id_tipodescuento);
            desc.setDescuento(descuento);
            desc.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(descuento);
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
    
    return descuentos;
}
   
}

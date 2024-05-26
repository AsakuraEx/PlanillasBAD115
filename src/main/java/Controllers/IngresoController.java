/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.TipoIngreso;
import Models.Ingreso;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class IngresoController {
        
    public void create(int id_empleado, int id_tipoingreso, LocalDate fechaingreso,  float ingreso,   String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            Ingreso ing = new Ingreso();
            ing.setFechaingreso(fechaingreso);
            ing.setIngreso(ingreso);
            ing.setId_tipoingreso(id_tipoingreso);
            ing.setId_empleado(id_empleado);
            ing.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(ing);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
    
    public Ingreso search(int id){

        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        Session session = sessionFactory.openSession();
        Ingreso ingreso = null;
        try{
            session.beginTransaction();
            ingreso = session.get(Ingreso.class, id);
            session.getTransaction().commit();
            sessionFactory.close();
        } catch(Exception e){
            e.printStackTrace();
        }

        return ingreso;
    }
    
    
    public List<Ingreso> mostrarIngreso(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Ingreso> ingresos = null;

            try{
                session.beginTransaction();
                Query<Ingreso> query = session.createQuery("FROM Ingreso", Ingreso.class);
                ingresos = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return ingresos;
    }


    public List<Ingreso> mostrarIngresosPorEmpleado(int empleado) {
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        Session session = sessionFactory.openSession();
        List<Ingreso> ingresos = null;

        try {
            session.beginTransaction();
            Query<Ingreso> query = session.createQuery("FROM Ingreso WHERE id_empleado = :empleado", Ingreso.class);
            query.setParameter("empleado", empleado);
            ingresos = query.getResultList();
            session.getTransaction().commit();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }

        return ingresos;
    }
    public void update(Ingreso ingreso){

    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
    SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
    //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
    Session session = sessionFactory.openSession();

    try{

        session.beginTransaction();
        session.update(ingreso);
        session.getTransaction().commit();
        sessionFactory.close();

    }catch(Exception e){
        e.printStackTrace();
    }    
    
    } 
     
}

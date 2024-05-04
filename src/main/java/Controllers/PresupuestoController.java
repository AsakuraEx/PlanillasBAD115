
package Controllers;

import Models.Presupuesto;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class PresupuestoController {
//    
    public void create(int deporg, int mes, float monto, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Presupuesto.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            Presupuesto presupuestos = new Presupuesto();
            presupuestos.setId_deporg(deporg);
            presupuestos.setId_mes(mes);
            presupuestos.setMonto(monto);
            presupuestos.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(presupuestos);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
    
    public List<Presupuesto> mostrarPresupuestos(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Presupuesto.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Presupuesto> presupuestos = null;

            try{
                session.beginTransaction();
                Query<Presupuesto> query = session.createQuery("FROM Presupuesto", Presupuesto.class);
                presupuestos = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return presupuestos;
    }
    
    
    public Presupuesto search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Presupuesto.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Presupuesto presupuesto = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            presupuesto = session.get(Presupuesto.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        
        return presupuesto;
    }    
    
    public void update(Presupuesto presupuesto){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Presupuesto.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(presupuesto);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }    
}

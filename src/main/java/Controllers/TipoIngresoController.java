/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import Models.TipoIngreso;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
/**
 *
 * @author Juanjo
 */
public class TipoIngresoController {

    public boolean create(String nombre, String habilitado){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoIngreso.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            TipoIngreso tipoingreso = new TipoIngreso();
            tipoingreso.setNombretipoingreso(nombre);
            tipoingreso.setHabilitado(habilitado);
                       
            session.beginTransaction();
            session.save(tipoingreso);
            session.getTransaction().commit();
            sessionFactory.close();
           
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }

    }
    
  public List<TipoIngreso> mostrarTipoIngreso(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoIngreso.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<TipoIngreso> tipoingreso = null;
        
        try{
            session.beginTransaction();
            Query<TipoIngreso> query = session.createQuery("FROM TipoIngreso", TipoIngreso.class);
            tipoingreso = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            sessionFactory.close();

        }
        return tipoingreso;
    }

}
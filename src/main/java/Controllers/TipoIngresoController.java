/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import Models.Empresa;
import Models.TipoIngreso;
import java.util.List;
//import javax.servlet.http.HttpServletRequest;
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

    private SessionFactory factory;

    public boolean create(String nombre, String habilitado){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoIngreso.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            TipoIngreso tipoingreso = new TipoIngreso();
            tipoingreso.setNombretipoingreso(nombre);
            tipoingreso.setHabilitado(habilitado);
            
            System.out.print(tipoingreso.toString());
            
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
    
    
    /**
     * Lista todos los tipos de ingreso.
     * @return List<TipoIngreso>
     */
  public List<TipoIngreso> mostrarTipoIngreso(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoIngreso.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<TipoIngreso> tipoingreso = null;
        session.beginTransaction();
        Query<TipoIngreso> query = session.createQuery("FROM TipoIngreso WHERE habilitado='1'", TipoIngreso.class);
        tipoingreso = query.getResultList();
        session.getTransaction().commit();
        sessionFactory.close();
        return tipoingreso;
       /** try{
            session.beginTransaction();
            Query<TipoIngreso> query = session.createQuery("FROM TipoIngreso WHERE habilitado='1'", TipoIngreso.class);
            tipoingreso = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
           // sessionFactory.close();

        }
        return tipoingreso;
    }**/}

    /**
     * Agrega o actualiza un TipoIngreso.
     * @param tipoIngreso TipoIngreso a agregar o actualizar.
     */
    public void tipoIngresoStore(TipoIngreso tipoIngreso) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(tipoIngreso);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    /**
     * Busca un TipoIngreso por su ID.
     * @param id int
     * @return TipoIngreso
     */
    public TipoIngreso obtenerTipoIngreso(int id) {
        Session session = factory.openSession();
        try {
            return session.get(TipoIngreso.class, id);
        } finally {
            session.close();
        }
    }

    /**
     * Elimina un TipoIngreso por su ID.
     * @param id int
     */
    public void eliminarTipoIngreso(int id) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            TipoIngreso tipoIngreso = session.get(TipoIngreso.class, id);
            if (tipoIngreso != null) {
                session.delete(tipoIngreso);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
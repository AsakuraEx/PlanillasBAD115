/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import java.util.ArrayList;
import Models.DepUnidadOrgani;
import Models.AreaUnidadOrgani;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author Juanjo
 */
public class AreaUnidadOrganiController {
     public void create(String NOMBREAREAUNIDADORG, int ID_DEPORG, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(AreaUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            AreaUnidadOrgani area = new AreaUnidadOrgani();
            area.setNOMBREAREAUNIDADORG(NOMBREAREAUNIDADORG);
            area.setID_DEPORG(ID_DEPORG);
            area.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(area);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
        public List<AreaUnidadOrgani> mostrarAreas() {
        // Crear un objeto SessionFactory para cargar la configuración de Hibernate
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(AreaUnidadOrgani.class).buildSessionFactory();
        // Abrir una sesión con la base de datos
        Session session = sessionFactory.openSession();
        List<AreaUnidadOrgani> unidades = null;
        
        try {
            // Iniciar una transacción
            session.beginTransaction();
            // Crear una consulta HQL para obtener todos los registros de DepUnidadOrgani
            Query<AreaUnidadOrgani> query = session.createQuery("from AreaUnidadOrgani", AreaUnidadOrgani.class);
            // Ejecutar la consulta y obtener la lista de resultados
            unidades = query.getResultList();
            // Completar la transacción
            session.getTransaction().commit();
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            // Cerrar la sesión y la fábrica de sesiones
            session.close();
            sessionFactory.close();
        }
        return unidades;
    }
    
    public AreaUnidadOrgani search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(AreaUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        AreaUnidadOrgani unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(AreaUnidadOrgani.class, id);
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

    public void update(AreaUnidadOrgani depunidad){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(AreaUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(depunidad);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }
}

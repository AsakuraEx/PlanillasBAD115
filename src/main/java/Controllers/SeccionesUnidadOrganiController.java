/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import java.util.ArrayList;
import Models.SeccionesUnidadOrgani;
import Models.Unidadorganizativa;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
/**
 *
 * @author Juanjo
 */
public class SeccionesUnidadOrganiController {
    
      public void create(String NOMBRESECCIONUNIORG, int ID_AREAUNIDADORG, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SeccionesUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            SeccionesUnidadOrgani secciones = new SeccionesUnidadOrgani();
            secciones.setNOMBRESECCIONUNIORG(NOMBRESECCIONUNIORG);
            secciones.setID_AREAUNIDADORG(ID_AREAUNIDADORG);
            secciones.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(secciones);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
        public List<SeccionesUnidadOrgani> mostrarSecciones() {
        // Crear un objeto SessionFactory para cargar la configuración de Hibernate
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SeccionesUnidadOrgani.class).buildSessionFactory();
        // Abrir una sesión con la base de datos
        Session session = sessionFactory.openSession();
        List<SeccionesUnidadOrgani> unidades = null;
        
        try {
            // Iniciar una transacción
            session.beginTransaction();
            // Crear una consulta HQL para obtener todos los registros de DepUnidadOrgani
            Query<SeccionesUnidadOrgani> query = session.createQuery("from SeccionesUnidadOrgani", SeccionesUnidadOrgani.class);
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

    public SeccionesUnidadOrgani search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SeccionesUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        SeccionesUnidadOrgani unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(SeccionesUnidadOrgani.class, id);
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

    public void update(SeccionesUnidadOrgani area){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SeccionesUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(area);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }
}
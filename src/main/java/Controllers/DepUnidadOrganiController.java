/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import java.util.ArrayList;

import Models.DepUnidadOrgani;
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
public class DepUnidadOrganiController {
    
      public void create(String nombredeporg, int id_unidadorg, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            DepUnidadOrgani departamento = new DepUnidadOrgani();
            departamento.setNombredeporg(nombredeporg);
            departamento.setId_unidadorg(id_unidadorg);
            departamento.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(departamento);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
        public List<DepUnidadOrgani> mostrarUnidades1() {
        // Crear un objeto SessionFactory para cargar la configuración de Hibernate
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
        // Abrir una sesión con la base de datos
        Session session = sessionFactory.openSession();
        List<DepUnidadOrgani> unidades = null;
        
        try {
            // Iniciar una transacción
            session.beginTransaction();
            // Crear una consulta HQL para obtener todos los registros de DepUnidadOrgani
            Query<DepUnidadOrgani> query = session.createQuery("from DepUnidadOrgani", DepUnidadOrgani.class);
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
    /*public List<DepUnidadOrgani> mostrarUnidades(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<DepUnidadOrgani> unidades = null;

            try{
                session.beginTransaction();
                Query<DepUnidadOrgani> query = session.createQuery("FROM DepUnidadOrgani WHERE habilitado='1'", DepUnidadOrgani.class);
                unidades = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return unidades;
    }*/
     /*public List<DepUnidadOrgani> mostrarUnidades() {
    SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
    Session session = sessionFactory.openSession();
    List<DepUnidadOrgani> unidades = new ArrayList<>(); // Inicializa como lista vacía

    try {
        session.beginTransaction();
        Query<DepUnidadOrgani> query = session.createQuery("FROM DepUnidadOrgani", DepUnidadOrgani.class);
        unidades = query.getResultList();
        session.getTransaction().commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sessionFactory.close();
    }
    return unidades;
}*/
    
    public DepUnidadOrgani search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        DepUnidadOrgani unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(DepUnidadOrgani.class, id);
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

    public void update(DepUnidadOrgani depunidad){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(DepUnidadOrgani.class).buildSessionFactory();
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

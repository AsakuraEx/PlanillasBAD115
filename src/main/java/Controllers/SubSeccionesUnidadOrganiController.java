/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.SubSeccionesUnidadOrgani;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author Juanjo
 */
public class SubSeccionesUnidadOrganiController {
   public void create(String NOMBRESUBSECUNIORG, int ID_SECCIONUNIORG, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SubSeccionesUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            SubSeccionesUnidadOrgani subSec = new SubSeccionesUnidadOrgani();
            subSec.setNOMBRESUBSECUNIORG(NOMBRESUBSECUNIORG);
            subSec.setID_SECCIONUNIORG(ID_SECCIONUNIORG);
            subSec.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(subSec);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
        public List<SubSeccionesUnidadOrgani> mostrarSubSec() {
        // Crear un objeto SessionFactory para cargar la configuración de Hibernate
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SubSeccionesUnidadOrgani.class).buildSessionFactory();
        // Abrir una sesión con la base de datos
        Session session = sessionFactory.openSession();
        List<SubSeccionesUnidadOrgani> unidades = null;
        
        try {
            // Iniciar una transacción
            session.beginTransaction();
            // Crear una consulta HQL para obtener todos los registros de DepUnidadOrgani
            Query<SubSeccionesUnidadOrgani> query = session.createQuery("from SubSeccionesUnidadOrgani", SubSeccionesUnidadOrgani.class);
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

    public SubSeccionesUnidadOrgani search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SubSeccionesUnidadOrgani.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        SubSeccionesUnidadOrgani unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(SubSeccionesUnidadOrgani.class, id);
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

    public void update(SubSeccionesUnidadOrgani depunidad){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(SubSeccionesUnidadOrgani.class).buildSessionFactory();
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

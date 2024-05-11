
package Controllers;

import Models.Documento;
import Models.Empleado;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class DocumentoController {
    
    public void create(Empleado empleado, int tipodocumento, String ndocumento, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Documento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            Documento documento = new Documento();
            documento.setId_empleado(empleado.getId_empleado());
            documento.setId_tipodocumento(tipodocumento);
            documento.setNumerodocumento(ndocumento);
            documento.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(documento);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
    
    public List<Documento> mostrarDocumentos(int idEmpleado){
                    
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Documento.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Documento> documentos = null;

            try{
                session.beginTransaction();
                Query<Documento> query = session.createQuery("FROM Documento WHERE id_empleado = :idEmpleado ORDER BY id_tipodocumento ASC", Documento.class);
                query.setParameter("idEmpleado", idEmpleado);
                documentos = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return documentos;
    } 
    
    
    public Documento search(int idEmpleado, int idTipoDocumento) {

        // Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Documento.class).buildSessionFactory();
        // Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Documento doc = null;
        // Intenta lo siguiente...
        try {
            // Inicia una transaccion el objeto session
            session.beginTransaction();
            // Crea una consulta HQL para obtener el documento de un empleado específico
            Query query = session.createQuery("FROM Documento WHERE id_empleado = :idEmpleado AND id_tipodocumento = :idTipoDocumento");
            query.setParameter("idEmpleado", idEmpleado);
            query.setParameter("idTipoDocumento", idTipoDocumento);
            // Ejecuta la consulta y obtiene el resultado (debería ser un solo documento)
            doc = (Documento) query.uniqueResult();
            // Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
        } catch (Exception e) {
            // En caso de error imprime la pila de errores
            e.printStackTrace();
        } finally {
            // Se cierra la conexion a la base de datos
            session.close();
            sessionFactory.close();
        }

        return doc;
    }
    
    public void update(Empleado emp, Documento doc){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).addAnnotatedClass(Documento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(emp); // Actualización de objeto Empleado
            session.update(doc);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    } 
}

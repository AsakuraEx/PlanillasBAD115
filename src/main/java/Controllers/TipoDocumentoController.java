package Controllers;

import Models.TipoDocumento;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TipoDocumentoController {
    
    public List<TipoDocumento> mostrarTipoDocumento() {

        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoDocumento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<TipoDocumento> tiposdocumentos = null;

        try {
            session.beginTransaction();
            Query<TipoDocumento> query = session.createQuery("FROM TipoDocumento", TipoDocumento.class);
            tiposdocumentos = query.getResultList();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sessionFactory.close();

        }
        return tiposdocumentos;
    }
    
     public TipoDocumento search(int id) {

        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(TipoDocumento.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        TipoDocumento tipodocumento = null;
        //Intenta lo siguiente...
        try {
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            tipodocumento = session.get(TipoDocumento.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();

        } catch (Exception e) {
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }

        return tipodocumento;
    }
    
}

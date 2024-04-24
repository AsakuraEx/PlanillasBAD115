/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Empresa;
import Models.Unidadorganizativa;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author frane
 */
public class UnidadorgController {
    
    public void create(String unidadorganizativa, int empresa, String habilitado){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Unidadorganizativa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
                                      
        try{
            Unidadorganizativa unidad = new Unidadorganizativa();
            unidad.setNombreunidadorg(unidadorganizativa);
            unidad.setId_empresa(empresa);
            unidad.setHabilitado(habilitado);
                                
            session.beginTransaction();
            session.save(unidad);
            session.getTransaction().commit();
            sessionFactory.close();

          
        }catch(Exception e){
            e.printStackTrace();

        } 
    }
    
    public List<Unidadorganizativa> mostrarUnidades(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Unidadorganizativa.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Unidadorganizativa> unidades = null;

            try{
                session.beginTransaction();
                Query<Unidadorganizativa> query = session.createQuery("FROM Unidadorganizativa", Unidadorganizativa.class);
                unidades = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return unidades;
    }
    
    public Unidadorganizativa search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Unidadorganizativa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Unidadorganizativa unidad = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            unidad = session.get(Unidadorganizativa.class, id);
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

    public void update(Unidadorganizativa unidad){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Unidadorganizativa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(unidad);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import Models.Empresa;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author frane
 */
public class EmpresaController {
    
    public boolean create(String nombre, String correo, String direccion, String telefono, String nic, String nit, String paginaweb, String habilitado){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            Empresa empresa = new Empresa();
            empresa.setNombreempresa(nombre);
            empresa.setCorreoempresa(correo);
            empresa.setDireccion(direccion);
            empresa.setTelefono(telefono);
            empresa.setNic(nic);
            empresa.setNit(nit);
            empresa.setPaginaweb(paginaweb);
            empresa.setHabilitado(habilitado);
            
            System.out.print(empresa.toString());
            
            session.beginTransaction();
            session.save(empresa);
            session.getTransaction().commit();
            sessionFactory.close();
           
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }

    }
    
    public List<Empresa> mostrarEmpresas(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<Empresa> empresas = null;
        
        try{
            session.beginTransaction();
            Query<Empresa> query = session.createQuery("FROM Empresa WHERE habilitado='1'", Empresa.class);
            empresas = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            sessionFactory.close();

        }
        return empresas;
    }
    
    public Empresa search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Empresa empresa = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            empresa = session.get(Empresa.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        
        return empresa;
    }
    
    public void update(Empresa empresa){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empresa);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }
    
        public void delete(Empresa empresa){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empresa);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }
    
    
    /*  
    
    BORRADO TOTAL DE LA BASE DE DATOS
    
    public void delete(int id){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empresa.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            Empresa empresa = session.get(Empresa.class, id);
            session.delete(empresa);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
       
    } */
    
}
        

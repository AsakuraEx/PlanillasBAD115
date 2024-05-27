/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;
import Models.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author frane
 */
public class UsuarioController {

    public boolean create(String usuario, String email, String contrasena){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Usuario.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            Usuario user = new Usuario();
            user.setUsuario(usuario);
            user.setEmail(email);
            user.setContrasena(contrasena);
            user.setRol("r");
            
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            sessionFactory.close();
           
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }

    }
    
}

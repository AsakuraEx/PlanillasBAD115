/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Sexo;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author frane
 */
public class SexoController {
       
    //METODO SELECT PARA VISUALIZAR UN REGISTRO DE LA TABLA SEXO
    public String getSexo(int id){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        //Intenta lo siguiente...
        try{
            //Genera una instancia de la clase Sexo
            //Se iguala al metodo get de Session para obtener de una clase, la informacion con el id
            Sexo sexo = session.get(Sexo.class, id);
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
            //Retorna en texto el objeto mostrado
            return sexo.toString();
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        //Si no logra realizar el try catch retorna el siguiente mensaje de error
        return "Error al actualizar el sexo al catalogo";
    }
    
        public List<Sexo> mostrarSexos(){
                    //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
            //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
            Session session = sessionFactory.openSession();
            List<Sexo> unidades = null;

            try{
                session.beginTransaction();
                Query<Sexo> query = session.createQuery("FROM Sexo", Sexo.class);
                unidades = query.getResultList();
                session.getTransaction().commit();
                
            }catch(Exception e){
                e.printStackTrace();

            }finally{
                sessionFactory.close();            
            }
            return unidades;
    }
        
    public Sexo search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Sexo empleado = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            empleado = session.get(Sexo.class, id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        
        return empleado;
    }
        
}

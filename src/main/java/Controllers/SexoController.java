/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Sexo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author frane
 */
public class SexoController {
    
//METODO CREATE PARA ANADIR NUEVO VALOR A LA TABLA SEXO (REQUIERE EL NOMBRE DEL SEXO)
    public String createSexo(String nombre){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        //Intenta lo siguiente...
        try{
            //Instancia un objeto sexo con el parametro sexo que viene del metodo
            Sexo sexo = new Sexo(nombre);
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Guarda en memoria la informacion recolectada
            session.save(sexo);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
            //Retorna el mensaje de exito
            return "El sexo se ha creado con exito...";
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        //Si no logra realizar el try catch retorna el siguiente mensaje de error
        return "Error al anadir el sexo al catalogo";
    }

    //METODO DELETE PARA ELIMINAR UN VALOR COMPLETO DE LA BASE DE DATOS
    public String deleteSexo(int id){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            session.delete(id);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
            //Retorna el mensaje de exito
            return "El sexo se ha eliminado con exito...";
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        //Si no logra realizar el try catch retorna el siguiente mensaje de error
        return "Error al borrar el sexo al catalogo";
    }
    
        //METODO UPDATE PARA ACTUALIZAR EL NOMBRE DE UN REGISTRO DE LA TABLA SEXO
    public String updateSexo(int id, String nombre){
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Sexo.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        //Intenta lo siguiente...
        try{
            //Genera una instancia de la clase Sexo
            //Se iguala al metodo get de Session para obtener de una clase, la informacion con el id
            Sexo sexo = session.get(Sexo.class, id);
            //Al obtener la informacion del id, se asigna el nuevo nombre a la variable
            sexo.setNombreSexo(nombre);
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Actualiza el registro con el parametro id
            session.update(sexo);
            //Obtiene la transaccion en memoria y guarda los valores en la base de datos
            session.getTransaction().commit();
            //Se cierra la conexion a la base de datos
            sessionFactory.close();
            
            //Retorna el mensaje de exito
            return "El sexo se ha actualizado con exito...";
        } catch(Exception e){
            //En caso de error imprime la pila de errores
            e.printStackTrace();
        }
        //Si no logra realizar el try catch retorna el siguiente mensaje de error
        return "Error al actualizar el sexo al catalogo";
    }
    
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
}

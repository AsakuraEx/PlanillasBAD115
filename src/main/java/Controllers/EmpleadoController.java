/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Empleado;
import java.time.LocalDate;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author frane
 */
public class EmpleadoController {
    
    public Empleado create(String primernombre, String segundonombre, String primerapellido, String segundoapellido, String apellidocasada, LocalDate fechanacimiento, double salario, String correopersonal, String correoinstitucional, int id_sexo, int id_estadocivil, int id_profesion, int id_puesto, int id_municipio, String habilitado, String nup, String nit, String numeroisss){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
     
            Empleado empleado = new Empleado();
            empleado.setPrimernombre(primernombre);
            empleado.setSegundonombre(segundonombre);
            empleado.setPrimerapellido(primerapellido);
            empleado.setSegundoapellido(segundoapellido);
            empleado.setApellidocasada(apellidocasada);
            empleado.setFechanacimiento(fechanacimiento);
            
            //FECHA INGRESO AL SISTEMA = FECHA DEL DIA ACTUAL
            LocalDate fechaingreso = LocalDate.now();
            empleado.setFechaingresosistema(fechaingreso);
            
            empleado.setSalario(salario);
            empleado.setCorreopersonal(correopersonal);
            empleado.setCorreoinstitucional(correoinstitucional);
            empleado.setId_sexo(id_sexo);
            empleado.setId_estadocivil(id_estadocivil);
            empleado.setId_profesion(id_profesion);
            empleado.setId_puesto(id_puesto);
            empleado.setId_municipio(id_municipio);
            empleado.setHabilitado(habilitado);
            
            empleado.setNup(nup);
            empleado.setNit(nit);
            empleado.setNumeroisss(numeroisss);
            
            System.out.print(empleado.toString());
                        
            session.beginTransaction();
            session.save(empleado);
            session.getTransaction().commit();
            sessionFactory.close();
           
            return empleado;

        
    }
    
    public List<Empleado> mostrarEmpleados(){
       
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        List<Empleado> empleados = null;
        
        try{
            session.beginTransaction();
            Query<Empleado> query = session.createQuery("FROM Empleado WHERE habilitado='1'", Empleado.class);
            empleados = query.getResultList();
            session.getTransaction().commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            sessionFactory.close();

        }
        return empleados;
    }

    public Empleado search(int id){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        Empleado empleado = null;
        //Intenta lo siguiente...
        try{
            //Inicia una transaccion el objeto session
            session.beginTransaction();
            //Elimina el registro con el parametro id
            empleado = session.get(Empleado.class, id);
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

        public void delete(Empleado empleado){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empleado);
            session.getTransaction().commit();
            sessionFactory.close();
           
        }catch(Exception e){
            e.printStackTrace();
        }    
    
    }    

    public Empleado update(Empleado empleado){
    
        //Se genera un objeto SessionFactory para cargar la configuracion hibernate.cfg.xml
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Empleado.class).buildSessionFactory();
        //Se abre la sesion con la base de datos (en cualquier operacion CRUD)
        Session session = sessionFactory.openSession();
        
        try{
            
            session.beginTransaction();
            session.update(empleado);
            session.getTransaction().commit();
            // Cargar el objeto actualizado desde la base de datos
            Empleado empleadoActualizado = session.get(Empleado.class, empleado.getId_empleado());
            sessionFactory.close();
            return empleadoActualizado; // Devuelve el objeto actualizado
           
        }catch(Exception e){
            e.printStackTrace();
             return null; // 
        }       
    }
        
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Models.Descuento;
import Models.Empleado;
import Models.Ingreso;
import Models.TipoDescuento;
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
    public double sumarDescuentosEmpleado(int idEmpleado) {
            double sumaDescuentos1 = 0.0;
            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Descuento.class).buildSessionFactory();
            Session session = sessionFactory.openSession();
            List<Descuento> descuentos = null;

            try {
                session.beginTransaction();
                Query query = session.createQuery("from Descuento where ID_EMPLEADO = :idEmpleado and habilitado = 1");
                query.setParameter("idEmpleado", idEmpleado);
                descuentos = query.list(); // Obtener la lista de descuentos
                session.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                session.close();
                sessionFactory.close();
            }
            TipoDescuentoController p =new TipoDescuentoController();
            List<TipoDescuento> descuentos1 = null;
            descuentos1=p.mostrarTipoDescuentoley();
            int h = descuentos1.size();
    
            EmpleadoController emple2 =new EmpleadoController();
            Empleado emp2 = emple2.search(idEmpleado);
    

            for (int y = 0; y <= h-1; y++) {
                float descuento;
    
                if (descuentos1.get(y).getNombretipodesc().equals("ISSS")) {
                    descuento = 30;
                } else {
                    descuento = (float) emp2.getSalario() * descuentos1.get(y).getPorcentaje() / 100;
                }
            Descuento tempDescuento = new Descuento(
                y+1000,                      // id_descuento (solo para identificar temporalmente)
                LocalDate.now(),        // fechadescuento
                descuento,              // descuento
                descuentos1.get(y).getId_tipodescuento(),                      // id_tipodescuento
                idEmpleado,               // id_empleado
                "1"                     // habilitado
            );
                descuentos.add(tempDescuento);
        }
        for (Descuento descuento : descuentos) {
            sumaDescuentos1 += descuento.getDESCUENTO();

        }
        return sumaDescuentos1;
    }
       
    public double sumarIngresosEmpleado(int idEmpleado) {
        SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Ingreso.class).buildSessionFactory();
        Session session = sessionFactory.openSession();
        double sumaIngresos = 0.0;

        try {
            session.beginTransaction();
            Query query = session.createQuery("select sum(ingreso) from Ingreso where id_empleado = :idEmpleado and habilitado = 1");
            query.setParameter("idEmpleado", idEmpleado);
            sumaIngresos = (Double) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }

        return sumaIngresos;
    }
       

}

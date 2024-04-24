/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
/**
 *
 * @author Juanjo
 */
@Entity
@Table(name = "TipoIngreso")
public class TipoIngreso {
        public TipoIngreso (){
    
    }    
    @Id
    @Column(name = "id_tipoingreso", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_tipoingreso;
    
    @Column(name = "nombretipoingreso")
    private String nombretipoingreso;
    
    @Column(name="habilitado")    
    private String habilitado;

    public int getId_tipoingreso() {
        return id_tipoingreso;
    }

    public void setId_tipoingreso(int id_tipoingreso) {
        this.id_tipoingreso = id_tipoingreso;
    }

    public String getNombretipoingreso() {
        return nombretipoingreso;
    }

    public void setNombretipoingreso(String nombretipoingreso) {
        this.nombretipoingreso = nombretipoingreso;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "TipoIngreso{" + "id_tipoingreso=" + id_tipoingreso + ", nombretipoingreso=" + nombretipoingreso + ", habilitado=" + habilitado + '}';
    }

    public TipoIngreso(int id_tipoingreso, String nombretipoingreso, String habilitado) {
        this.id_tipoingreso = id_tipoingreso;
        this.nombretipoingreso = nombretipoingreso;
        this.habilitado = habilitado;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Ingreso")
public class Ingreso {
    
    @Id
    @Column(name = "id_ingreso", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_ingreso;

    @Column(name="fechaingreso")
    LocalDate fechaingreso;
    
    @Column(name="ingreso")
    float ingreso;
    
    @Column(name="id_tipoingreso")
    int id_tipoingreso;
    
    @Column(name="id_empleado")
    int id_empleado;

    @Column(name = "habilitado")
    private String habilitado;

    public int getId_ingreso() {
        return id_ingreso;
    }

    public void setId_ingreso(int id_ingreso) {
        this.id_ingreso = id_ingreso;
    }

    public LocalDate getFechaingreso() {
        return fechaingreso;
    }

    public void setFechaingreso(LocalDate fechaingreso) {
        this.fechaingreso = fechaingreso;
    }

    public float getIngreso() {
        return ingreso;
    }

    public void setIngreso(float ingreso) {
        this.ingreso = ingreso;
    }

    public int getId_tipoingreso() {
        return id_tipoingreso;
    }

    public void setId_tipoingreso(int id_tipoingreso) {
        this.id_tipoingreso = id_tipoingreso;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    

    public Ingreso() {
    }

    public Ingreso(int id_ingreso, LocalDate fechaingreso, float ingreso, int id_tipoingreso, int id_empleado, String habilitado) {
        this.id_ingreso = id_ingreso;
        this.fechaingreso = fechaingreso;
        this.ingreso = ingreso;
        this.id_tipoingreso = id_tipoingreso;
        this.id_empleado = id_empleado;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Ingreso{" + "id_ingreso=" + id_ingreso + ", fechaingreso=" + fechaingreso + ", ingreso=" + ingreso + ", id_tipoingreso=" + id_tipoingreso + ", id_empleado=" + id_empleado + ", habilitado=" + habilitado + '}';
    }
    
    

}

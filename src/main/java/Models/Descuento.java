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

/**
 *
 * @author Juanjo
 */
@Entity
@Table(name = "descuento")
public class Descuento {
    
    @Id
    @Column(name = "id_descuento", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_descuento;

    @Column(name="fechadescuento")
    LocalDate fechadescuento;
    
    @Column(name="descuento")
    float descuento;
    
    @Column(name="id_tipodescuento")
    int id_tipodescuento;
    
    @Column(name="id_empleado")
    int id_empleado;

    @Column(name = "habilitado")
    private String habilitado;

    public int getId_descuento() {
        return id_descuento;
    }

    public void setId_descuento(int id_descuento) {
        this.id_descuento = id_descuento;
    }

    public LocalDate getFechadescuento() {
        return fechadescuento;
    }

    public void setFechadescuento(LocalDate fechadescuento) {
        this.fechadescuento = fechadescuento;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public int getId_tipodescuento() {
        return id_tipodescuento;
    }

    public void setId_tipodescuento(int id_tipodescuento) {
        this.id_tipodescuento = id_tipodescuento;
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

    public Descuento() {
    }

    public Descuento(int id_descuento, LocalDate fechadescuento, float descuento, int id_tipodescuento, int id_empleado, String habilitado) {
        this.id_descuento = id_descuento;
        this.fechadescuento = fechadescuento;
        this.descuento = descuento;
        this.id_tipodescuento = id_tipodescuento;
        this.id_empleado = id_empleado;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Descuento{" + "id_descuento=" + id_descuento + ", fechadescuento=" + fechadescuento + ", descuento=" + descuento + ", id_tipodescuento=" + id_tipodescuento + ", id_empleado=" + id_empleado + ", habilitado=" + habilitado + '}';
    }

    
}

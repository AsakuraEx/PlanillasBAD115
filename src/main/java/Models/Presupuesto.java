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

@Entity
@Table(name="presupuesto")
public class Presupuesto {
    @Id
    @Column(name="id_presupuesto", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_presupuesto;
    
    @Column(name="id_deporg")
    private int id_deporg;
    
    @Column(name="id_mes")
    private int id_mes;
    
    @Column(name="monto")
    private float monto;
    
    @Column(name="habilitado")
    private String habilitado;

    public int getId_presupuesto() {
        return id_presupuesto;
    }

    public void setId_presupuesto(int id_presupuesto) {
        this.id_presupuesto = id_presupuesto;
    }

    public int getId_deporg() {
        return id_deporg;
    }

    public void setId_deporg(int id_deporg) {
        this.id_deporg = id_deporg;
    }

    public int getId_mes() {
        return id_mes;
    }

    public void setId_mes(int id_mes) {
        this.id_mes = id_mes;
    }

    

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Presupuesto() {
    }

    public Presupuesto(int id_presupuesto, int id_deporg, int id_mes, float monto, String habilitado) {
        this.id_presupuesto = id_presupuesto;
        this.id_deporg = id_deporg;
        this.id_mes = id_mes;
        this.monto = monto;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Presupuesto{" + "id_presupuesto=" + id_presupuesto + ", id_deporg=" + id_deporg + ", id_mes=" + id_mes + ", monto=" + monto + ", habilitado=" + habilitado + '}';
    }
    
    
}

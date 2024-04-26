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
@Table(name="puesto")
public class Puesto {
    
    @Id
    @Column(name="id_puesto", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_puesto;
    
    @Column(name="nombrepuesto")
    private String nombrepuesto;
      
    @Column(name="salariominimo")
    private float salariominimo;
    
    @Column(name="salariomaximo")
    private float salariomaximo;
    
    @Column(name="id_unidadorg")
    private int id_unidadorg;
        
    @Column(name="habilitado")
    private String habilitado;

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getNombrepuesto() {
        return nombrepuesto;
    }

    public void setNombrepuesto(String nombrepuesto) {
        this.nombrepuesto = nombrepuesto;
    }

    public int getId_unidadorg() {
        return id_unidadorg;
    }

    public void setId_unidadorg(int id_unidadorg) {
        this.id_unidadorg = id_unidadorg;
    }

    public float getSalariominimo() {
        return salariominimo;
    }

    public void setSalariominimo(float salariominimo) {
        this.salariominimo = salariominimo;
    }

    public float getSalariomaximo() {
        return salariomaximo;
    }

    public void setSalariomaximo(float salariomaximo) {
        this.salariomaximo = salariomaximo;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Puesto() {
    }

    public Puesto(int id_puesto, String nombrepuesto, float salariominimo, float salariomaximo, int id_unidadorg, String habilitado) {
        this.id_puesto = id_puesto;
        this.nombrepuesto = nombrepuesto;
        this.salariominimo = salariominimo;
        this.salariomaximo = salariomaximo;
        this.id_unidadorg = id_unidadorg;
        this.habilitado = habilitado;
    }

    
    @Override
    public String toString() {
        return "Puesto{" + "id_puesto=" + id_puesto + ", nombrepuesto=" + nombrepuesto + ", salariominimo=" + salariominimo + ", salariomaximo=" + salariomaximo + ", id_unidadorg=" + id_unidadorg +  ", habilitado=" + habilitado + '}';
    }
    
}


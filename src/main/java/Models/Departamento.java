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
 * @author frane
 */
@Entity
@Table(name="departamento")
public class Departamento {
    @Id
    @Column(name = "id_departamento", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_departamento;
    
    @Column(name = "nombredepartamento")
    private String nombredepartamento;   

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNombredepartamento() {
        return nombredepartamento;
    }

    public void setNombredepartamento(String nombredepartamento) {
        this.nombredepartamento = nombredepartamento;
    }

    public Departamento() {
    }

    public Departamento(int id_departamento, String nombredepartamento) {
        this.id_departamento = id_departamento;
        this.nombredepartamento = nombredepartamento;
    }

    @Override
    public String toString() {
        return "Departamento{" + "id_departamento=" + id_departamento + ", nombredepartamento=" + nombredepartamento + '}';
    }
       
}

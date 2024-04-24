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
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
/**
 *
 * @author frane
 */
@Entity
@Table(name="unidadorganizativa")
public class Unidadorganizativa {
    
    @Id
    @Column(name="id_unidadorg", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_unidadorg;
    
    @Column(name="nombreunidadorg")
    private String nombreunidadorg;
    
    @Column(name="id_empresa")
    private int id_empresa;
    
    @Column(name="habilitado")
    private String habilitado;

    public int getId_unidadorg() {
        return id_unidadorg;
    }

    public void setId_unidadorg(int id_unidadorg) {
        this.id_unidadorg = id_unidadorg;
    }
    
    public String getNombreunidadorg() {
        return nombreunidadorg;
    }

    public void setNombreunidadorg(String nombreunidadorg) {
        this.nombreunidadorg = nombreunidadorg;
    }

    public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Unidadorganizativa() {
    }

    public Unidadorganizativa(int id_unidadorg, String nombreunidadorg, int id_empresa, String habilitado) {
        this.id_unidadorg = id_unidadorg;
        this.nombreunidadorg = nombreunidadorg;
        this.id_empresa = id_empresa;
        this.habilitado = habilitado;
    }   

    @Override
    public String toString() {
        return "Unidadorganizativa{" + "id_unidadorg=" + id_unidadorg + ", nombreunidadorg=" + nombreunidadorg + ", id_empresa=" + id_empresa + ", habilitado=" + habilitado + '}';
    }
    
}

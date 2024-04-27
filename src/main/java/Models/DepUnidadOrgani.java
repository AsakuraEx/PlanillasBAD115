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
@Table(name="depunidadorgani")
public class DepUnidadOrgani {
     @Id
    @Column(name="id_deporg", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_deporg;
    
    @Column(name="nombredeporg")
    private String nombredeporg;
    
    @Column(name="id_unidadorg")
    private int id_unidadorg;
    
    @Column(name="habilitado")
    private String habilitado;

    public int getId_deporg() {
        return id_deporg;
    }

    public void setId_deporg(int id_deporg) {
        this.id_deporg = id_deporg;
    }

    public String getNombredeporg() {
        return nombredeporg;
    }

    public void setNombredeporg(String nombredeporg) {
        this.nombredeporg = nombredeporg;
    }

    public int getId_unidadorg() {
        return id_unidadorg;
    }

    public void setId_unidadorg(int id_unidadorg) {
        this.id_unidadorg = id_unidadorg;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public DepUnidadOrgani() {
    }
 public DepUnidadOrgani(int id_deporg, String nombredeporg, int id_unidadorg, String habilitado) {
        this.id_deporg = id_deporg;
        this.nombredeporg = nombredeporg;
        this.id_unidadorg = id_unidadorg;
        this.habilitado = habilitado;
    }
    @Override
    public String toString() {
        return "DepUnidadOrgani{" + "id_deporg=" + id_deporg + ", nombredeporg=" + nombredeporg + ", id_unidadorg=" + id_unidadorg + ", habilitado=" + habilitado + '}';
    }
    
}

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
@Table(name="areaunidadorgani")
public class AreaUnidadOrgani {
     @Id
    @Column(name="ID_AREAUNIDADORG", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int ID_AREAUNIDADORG;
    
    @Column(name="NOMBREAREAUNIDADORG")
    private String NOMBREAREAUNIDADORG;
    
    @Column(name="ID_DEPORG")
    private int ID_DEPORG;
    
    @Column(name="habilitado")
    private String habilitado;

    public AreaUnidadOrgani() {
    }

    public AreaUnidadOrgani(int ID_AREAUNIDADORG, String NOMBREAREAUNIDADORG, int ID_DEPORG, String habilitado) {
        this.ID_AREAUNIDADORG = ID_AREAUNIDADORG;
        this.NOMBREAREAUNIDADORG = NOMBREAREAUNIDADORG;
        this.ID_DEPORG = ID_DEPORG;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "AreaUnidadOrgani{" + "ID_AREAUNIDADORG=" + ID_AREAUNIDADORG + ", NOMBREAREAUNIDADORG=" + NOMBREAREAUNIDADORG + ", ID_DEPORG=" + ID_DEPORG + ", habilitado=" + habilitado + '}';
    }

    public int getID_AREAUNIDADORG() {
        return ID_AREAUNIDADORG;
    }

    public void setID_AREAUNIDADORG(int ID_AREAUNIDADORG) {
        this.ID_AREAUNIDADORG = ID_AREAUNIDADORG;
    }

    public String getNOMBREAREAUNIDADORG() {
        return NOMBREAREAUNIDADORG;
    }

    public void setNOMBREAREAUNIDADORG(String NOMBREAREAUNIDADORG) {
        this.NOMBREAREAUNIDADORG = NOMBREAREAUNIDADORG;
    }

    public int getID_DEPORG() {
        return ID_DEPORG;
    }

    public void setID_DEPORG(int ID_DEPORG) {
        this.ID_DEPORG = ID_DEPORG;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
    
    
}

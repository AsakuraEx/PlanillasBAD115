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
@Table(name="seccionesunidadorgani")
public class SeccionesUnidadOrgani {
     @Id
    @Column(name="ID_SECCIONUNIORG", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int ID_SECCIONUNIORG;
    
    @Column(name="NOMBRESECCIONUNIORG")
    private String NOMBRESECCIONUNIORG;
    
    @Column(name="ID_AREAUNIDADORG")
    private int ID_AREAUNIDADORG;
    
    @Column(name="habilitado")
    private String habilitado;

    public SeccionesUnidadOrgani() {
    }

    public SeccionesUnidadOrgani(int ID_SECCIONUNIORG, String NOMBRESECCIONUNIORG, int ID_AREAUNIDADORG, String habilitado) {
        this.ID_SECCIONUNIORG = ID_SECCIONUNIORG;
        this.NOMBRESECCIONUNIORG = NOMBRESECCIONUNIORG;
        this.ID_AREAUNIDADORG = ID_AREAUNIDADORG;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "SeccionesUnidadOrgani{" + "ID_SECCIONUNIORG=" + ID_SECCIONUNIORG + ", NOMBRESECCIONUNIORG=" + NOMBRESECCIONUNIORG + ", ID_AREAUNIDADORG=" + ID_AREAUNIDADORG + ", habilitado=" + habilitado + '}';
    }

    public int getID_SECCIONUNIORG() {
        return ID_SECCIONUNIORG;
    }

    public void setID_SECCIONUNIORG(int ID_SECCIONUNIORG) {
        this.ID_SECCIONUNIORG = ID_SECCIONUNIORG;
    }

    public String getNOMBRESECCIONUNIORG() {
        return NOMBRESECCIONUNIORG;
    }

    public void setNOMBRESECCIONUNIORG(String NOMBRESECCIONUNIORG) {
        this.NOMBRESECCIONUNIORG = NOMBRESECCIONUNIORG;
    }

    public int getID_AREAUNIDADORG() {
        return ID_AREAUNIDADORG;
    }

    public void setID_AREAUNIDADORG(int ID_AREAUNIDADORG) {
        this.ID_AREAUNIDADORG = ID_AREAUNIDADORG;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
    
    
}

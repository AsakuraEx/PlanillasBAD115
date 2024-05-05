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
@Table(name="subseccionesunidadorgani")
public class SubSeccionesUnidadOrgani {
     @Id
    @Column(name="ID_SUBSECUNIORG", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int ID_SUBSECUNIORG;
    
    @Column(name="NOMBRESUBSECUNIORG")
    private String NOMBRESUBSECUNIORG;
    
    @Column(name="ID_SECCIONUNIORG")
    private int ID_SECCIONUNIORG;
    
    @Column(name="habilitado")
    private String habilitado;

    public SubSeccionesUnidadOrgani() {
    }

    public SubSeccionesUnidadOrgani(int ID_SUBSECUNIORG, String NOMBRESUBSECUNIORG, int ID_SECCIONUNIORG, String habilitado) {
        this.ID_SUBSECUNIORG = ID_SUBSECUNIORG;
        this.NOMBRESUBSECUNIORG = NOMBRESUBSECUNIORG;
        this.ID_SECCIONUNIORG = ID_SECCIONUNIORG;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "SubSeccionesUnidadOrgani{" + "ID_SUBSECUNIORG=" + ID_SUBSECUNIORG + ", NOMBRESUBSECUNIORG=" + NOMBRESUBSECUNIORG + ", ID_SECCIONUNIORG=" + ID_SECCIONUNIORG + ", habilitado=" + habilitado + '}';
    }

    public int getID_SUBSECUNIORG() {
        return ID_SUBSECUNIORG;
    }

    public void setID_SUBSECUNIORG(int ID_SUBSECUNIORG) {
        this.ID_SUBSECUNIORG = ID_SUBSECUNIORG;
    }

    public String getNOMBRESUBSECUNIORG() {
        return NOMBRESUBSECUNIORG;
    }

    public void setNOMBRESUBSECUNIORG(String NOMBRESUBSECUNIORG) {
        this.NOMBRESUBSECUNIORG = NOMBRESUBSECUNIORG;
    }

    public int getID_SECCIONUNIORG() {
        return ID_SECCIONUNIORG;
    }

    public void setID_SECCIONUNIORG(int ID_SECCIONUNIORG) {
        this.ID_SECCIONUNIORG = ID_SECCIONUNIORG;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
    
    
}

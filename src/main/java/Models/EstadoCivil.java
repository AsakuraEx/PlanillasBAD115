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
@Table(name = "estadocivil")
public class EstadoCivil {
    @Id
    @Column(name = "id_estadocivil", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_estadocivil;
    
    @Column(name = "nombreestadocivil")
    private String nombreestadocivil;

    public int getId_estadocivil() {
        return id_estadocivil;
    }

    public void setId_estadocivil(int id_estadocivil) {
        this.id_estadocivil = id_estadocivil;
    }

    public String getNombreestadocivil() {
        return nombreestadocivil;
    }

    public void setNombreestadocivil(String nombreestadocivil) {
        this.nombreestadocivil = nombreestadocivil;
    }

    public EstadoCivil() {
    }

    public EstadoCivil(int id_estadocivil, String nombreestadocivil) {
        this.id_estadocivil = id_estadocivil;
        this.nombreestadocivil = nombreestadocivil;
    }

    @Override
    public String toString() {
        return "EstadoCivil{" + "id_estadocivil=" + id_estadocivil + ", nombreestadocivil=" + nombreestadocivil + '}';
    }
    
    
    
}
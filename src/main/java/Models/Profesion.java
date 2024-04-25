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
@Table(name="profesion")
public class Profesion {
    @Id
    @Column(name = "id_profesion", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_profesion;
    
    @Column(name = "nombreprofesion")
    private String nombreprofesion;
    
    @Column(name = "habilitado")
    private String habilitado;

    public int getId_profesion() {
        return id_profesion;
    }

    public void setId_profesion(int id_profesion) {
        this.id_profesion = id_profesion;
    }

    public String getNombreprofesion() {
        return nombreprofesion;
    }

    public void setNombreprofesion(String nombreprofesion) {
        this.nombreprofesion = nombreprofesion;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Profesion() {
    }

    public Profesion(int id_profesion, String nombreprofesion, String habilitado) {
        this.id_profesion = id_profesion;
        this.nombreprofesion = nombreprofesion;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Profesion{" + "id_profesion=" + id_profesion + ", nombreprofesion=" + nombreprofesion + ", habilitado=" + habilitado + '}';
    }
    
    
}

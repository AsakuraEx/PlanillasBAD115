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
@Table(name="municipio")
public class Municipio {
    @Id
    @Column(name = "id_municipio", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_municipio;
    
    @Column(name = "nombremunicipio")
    private String nombremunicipio;

    @Column(name = "id_departamento")
    private int id_departamento;

    public int getId_municipio() {
        return id_municipio;
    }

    public void setId_municipio(int id_municipio) {
        this.id_municipio = id_municipio;
    }

    public String getNombremunicipio() {
        return nombremunicipio;
    }

    public void setNombremunicipio(String nombremunicipio) {
        this.nombremunicipio = nombremunicipio;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public Municipio() {
    }

    public Municipio(int id_municipio, String nombremunicipio, int id_departamento) {
        this.id_municipio = id_municipio;
        this.nombremunicipio = nombremunicipio;
        this.id_departamento = id_departamento;
    }

    @Override
    public String toString() {
        return "Municipio{" + "id_municipio=" + id_municipio + ", nombremunicipio=" + nombremunicipio + ", id_departamento=" + id_departamento + '}';
    }
    
}

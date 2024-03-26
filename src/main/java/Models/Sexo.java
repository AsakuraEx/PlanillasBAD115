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
@Table(name = "Sexo")
public class Sexo {
    @Id
    @Column(name = "id_sexo", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_sexo;
    
    @Column(name = "nombreSexo")
    private String nombreSexo;

    public int getId_sexo() {
        return id_sexo;
    }

    public void setId_sexo(int id_sexo) {
        this.id_sexo = id_sexo;
    }

    public String getNombreSexo() {
        return nombreSexo;
    }

    public void setNombreSexo(String nombreSexo) {
        this.nombreSexo = nombreSexo;
    }

    @Override
    public String toString() {
        return "Sexo{" + "id_sexo=" + id_sexo + ", nombreSexo=" + nombreSexo + '}';
    }

    public Sexo (){
    
    }    
    
    public Sexo(String nombreSexo) {
        this.nombreSexo = nombreSexo;
    }
    
}

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
@Table(name= "usuario")
public class Usuario {
    @Id
    @Column(name="id_usuario", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_usuario;
    
    @Column(name="usuario")
    private String usuario;
    
    @Column(name="email")
    private String email;
    
    @Column(name="contrasena")
    private String contrasena;

    @Column(name="rol")
    private String rol = "r";

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public Usuario() {
    }

    public Usuario(int id_usuario, String usuario, String email, String contrasena) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.email = email;
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id_usuario=" + id_usuario + ", usuario=" + usuario + ", email=" + email + ", contrasena=" + contrasena + ", rol=" + rol + '}';
    }
    
    
    
}

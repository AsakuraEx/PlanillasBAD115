/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDate;
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
@Table(name= "empleado")
public class Empleado {
    @Id
    @Column(name="id_empleado", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)    
    int id_empleado;
    
    @Column(name="primernombre")
    String primernombre;

    @Column(name="segundonombre")
    String segundonombre;
    
    @Column(name="primerapellido")
    String primerapellido;
    
    @Column(name="segundoapellido")
    String segundoapellido;
    
    @Column(name="apellidocasada")
    String apellidocasada;
   
    @Column(name="fechanacimiento")
    LocalDate fechanacimiento;
    
    @Column(name="fechaingresosistema")
    LocalDate fechaingresosistema;
    
    @Column(name="salario")
    double salario;
    
    @Column(name="correopersonal")
    String correopersonal;
    
    @Column(name="correoinstitucional")
    String correoinstitucional;
    
    @Column(name="id_sexo")
    int id_sexo;
    
    @Column(name="id_estadocivil")
    int id_estadocivil;
    
    @Column(name="id_profesion")
    int id_profesion;
    
    @Column(name="id_puesto")
    int id_puesto;
    
    @Column(name="id_municipio")
    int id_municipio;
    
    @Column(name="habilitado")
    String habilitado;
    
    @Column(name="nup")
    String nup;
    
    @Column(name="nit")
    String nit;
    
    @Column(name="numeroisss")
    String numeroisss;

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getPrimernombre() {
        return primernombre;
    }

    public void setPrimernombre(String primernombre) {
        this.primernombre = primernombre;
    }

    public String getSegundonombre() {
        return segundonombre;
    }

    public void setSegundonombre(String segundonombre) {
        this.segundonombre = segundonombre;
    }

    public String getPrimerapellido() {
        return primerapellido;
    }

    public void setPrimerapellido(String primerapellido) {
        this.primerapellido = primerapellido;
    }

    public String getSegundoapellido() {
        return segundoapellido;
    }

    public void setSegundoapellido(String segundoapellido) {
        this.segundoapellido = segundoapellido;
    }

    public String getApellidocasada() {
        return apellidocasada;
    }

    public void setApellidocasada(String apellidocasada) {
        this.apellidocasada = apellidocasada;
    }

    public LocalDate getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(LocalDate fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public LocalDate getFechaingresosistema() {
        return fechaingresosistema;
    }

    public void setFechaingresosistema(LocalDate fechaingresosistema) {
        this.fechaingresosistema = fechaingresosistema;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getCorreopersonal() {
        return correopersonal;
    }

    public void setCorreopersonal(String correopersonal) {
        this.correopersonal = correopersonal;
    }

    public String getCorreoinstitucional() {
        return correoinstitucional;
    }

    public void setCorreoinstitucional(String correoinstitucional) {
        this.correoinstitucional = correoinstitucional;
    }

    public int getId_sexo() {
        return id_sexo;
    }

    public void setId_sexo(int id_sexo) {
        this.id_sexo = id_sexo;
    }

    public int getId_estadocivil() {
        return id_estadocivil;
    }

    public void setId_estadocivil(int id_estadocivil) {
        this.id_estadocivil = id_estadocivil;
    }

    public int getId_profesion() {
        return id_profesion;
    }

    public void setId_profesion(int id_profesion) {
        this.id_profesion = id_profesion;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public int getId_municipio() {
        return id_municipio;
    }

    public void setId_municipio(int id_municipio) {
        this.id_municipio = id_municipio;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public String getNup() {
        return nup;
    }

    public void setNup(String nup) {
        this.nup = nup;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNumeroisss() {
        return numeroisss;
    }

    public void setNumeroisss(String numeroisss) {
        this.numeroisss = numeroisss;
    }
    
    public Empleado() {
    }

    public Empleado(int id_empleado, String primernombre, String segundonombre, String primerapellido, String segundoapellido, String apellidocasada, LocalDate fechanacimiento, LocalDate fechaingresosistema, double salario, String correopersonal, String correoinstitucional, int id_sexo, int id_estadocivil, int id_profesion, int id_puesto, int id_municipio, String habilitado, String nup, String nit, String numeroisss) {
        this.id_empleado = id_empleado;
        this.primernombre = primernombre;
        this.segundonombre = segundonombre;
        this.primerapellido = primerapellido;
        this.segundoapellido = segundoapellido;
        this.apellidocasada = apellidocasada;
        this.fechanacimiento = fechanacimiento;
        this.fechaingresosistema = fechaingresosistema;
        this.salario = salario;
        this.correopersonal = correopersonal;
        this.correoinstitucional = correoinstitucional;
        this.id_sexo = id_sexo;
        this.id_estadocivil = id_estadocivil;
        this.id_profesion = id_profesion;
        this.id_puesto = id_puesto;
        this.id_municipio = id_municipio;
        this.habilitado = habilitado;
        this.nup = nup;
        this.nit = nit;
        this.numeroisss = numeroisss;
    }

    @Override
    public String toString() {
        return "Empleado{" + "id_empleado=" + id_empleado + ", primernombre=" + primernombre + ", segundonombre=" + segundonombre + ", primerapellido=" + primerapellido + ", segundoapellido=" + segundoapellido + ", apellidocasada=" + apellidocasada + ", fechanacimiento=" + fechanacimiento + ", fechaingresosistema=" + fechaingresosistema + ", salario=" + salario + ", correopersonal=" + correopersonal + ", correoinstitucional=" + correoinstitucional + ", id_sexo=" + id_sexo + ", id_estadocivil=" + id_estadocivil + ", id_profesion=" + id_profesion + ", id_puesto=" + id_puesto + ", id_municipio=" + id_municipio + ", habilitado=" + habilitado + '}';
    }
    
    
}

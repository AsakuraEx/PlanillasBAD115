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
@Table(name= "empresa")
public class Empresa {
    @Id
    @Column(name="id_empresa", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_empresa;
    
    @Column(name="nombreempresa")
    private String nombreempresa;
    
    @Column(name="correoempresa")
    private String correoempresa;
    
    @Column(name="direccion")
    private String direccion;
    
    @Column(name="nic")
    private String nic;
    
    @Column(name="nit")
    private String nit;
    
    @Column(name="telefono")
    private String telefono;
    
    @Column(name="paginaweb")
    private String paginaweb;

    @Column(name="habilitado")    
    private String habilitado;
    
        public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getNombreempresa() {
        return nombreempresa;
    }

    public void setNombreempresa(String nombreempresa) {
        this.nombreempresa = nombreempresa;
    }

    public String getCorreoempresa() {
        return correoempresa;
    }

    public void setCorreoempresa(String correoempresa) {
        this.correoempresa = correoempresa;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPaginaweb() {
        return paginaweb;
    }

    public void setPaginaweb(String paginaweb) {
        this.paginaweb = paginaweb;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
    

    public Empresa() {
    }

    public Empresa(int id_empresa, String nombreempresa, String correoempresa, String direccion, String nic, String nit, String telefono, String paginaweb, String habilitado) {
        this.id_empresa = id_empresa;
        this.nombreempresa = nombreempresa;
        this.correoempresa = correoempresa;
        this.direccion = direccion;
        this.nic = nic;
        this.nit = nit;
        this.telefono = telefono;
        this.paginaweb = paginaweb;
        this.habilitado = habilitado;
    }


    

    @Override
    public String toString() {
        return "Empresa{" + "id_empresa=" + id_empresa + ", nombreempresa=" + nombreempresa + ", correoempresa=" + correoempresa + ", direccion=" + direccion + ", nic=" + nic + ", nit=" + nit + ", telefono=" + telefono + ", paginaweb=" + paginaweb + '}';
    }
    
}

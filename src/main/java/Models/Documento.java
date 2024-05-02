
package Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Documento")
public class Documento {
    @Id
    @Column(name="id_documento", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="autoincremental_gen")
    @SequenceGenerator(name="autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_documento;
    
    @Column(name="id_empleado")
    private int id_empleado;
      
    @Column(name="id_tipodocumento")
    private int id_tipodocumento;
    
    @Column(name="numerodocumento")
    private String numerodocumento;
        
    @Column(name="habilitado")
    private String habilitado;

    public int getId_documento() {
        return id_documento;
    }

    public void setId_documento(int id_documento) {
        this.id_documento = id_documento;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_tipodocumento() {
        return id_tipodocumento;
    }

    public void setId_tipodocumento(int id_tipodocumento) {
        this.id_tipodocumento = id_tipodocumento;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Documento() {
    }

    public Documento(int id_documento, int id_empleado, int id_tipodocumento, String numerodocumento, String habilitado) {
        this.id_documento = id_documento;
        this.id_empleado = id_empleado;
        this.id_tipodocumento = id_tipodocumento;
        this.numerodocumento = numerodocumento;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Documento{" + "id_documento=" + id_documento + ", id_empleado=" + id_empleado + ", id_tipodocumento=" + id_tipodocumento + ", numerodocumento=" + numerodocumento + ", habilitado=" + habilitado + '}';
    }
    
    
}

package Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "tipodocumento")
public class TipoDocumento {
    @Id
    @Column(name = "id_tipodocumento", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_tipodocumento;

    @Column(name = "nombretipodocumento")
    private String nombretipodocumento;

    @Column(name = "habilitado")
    private String habilitado;

    public int getId_tipodocumento() {
        return id_tipodocumento;
    }

    public void setId_tipodocumento(int id_tipodocumento) {
        this.id_tipodocumento = id_tipodocumento;
    }

    public String getNombretipodocumento() {
        return nombretipodocumento;
    }

    public void setNombretipodocumento(String nombretipodocumento) {
        this.nombretipodocumento = nombretipodocumento;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public TipoDocumento() {
    }

    public TipoDocumento(int id_tipodocumento, String nombretipodocumento, String habilitado) {
        this.id_tipodocumento = id_tipodocumento;
        this.nombretipodocumento = nombretipodocumento;
        this.habilitado = habilitado;
    }
    
    
    @Override
    public String toString() {
        return "TipoDocumento{" + "id_tipodocumento=" + id_tipodocumento + ", nombretipodocumento=" + nombretipodocumento + ", habilitado=" + habilitado + '}';
    }
}

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

@Entity
@Table(name = "tipodescuento")
public class TipoDescuento {

    @Id
    @Column(name = "id_tipodescuento", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_tipodescuento;

    @Column(name = "nombretipodesc")
    private String nombretipodesc;

    @Column(name = "habilitado")
    private String habilitado;

    public int getId_tipodescuento() {
        return id_tipodescuento;
    }

    public void setId_tipodescuento(int id_tipodescuento) {
        this.id_tipodescuento = id_tipodescuento;
    }

    public String getNombretipodesc() {
        return nombretipodesc;
    }

    public void setNombretipodesc(String nombretipodesc) {
        this.nombretipodesc = nombretipodesc;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public TipoDescuento() {
    }

    public TipoDescuento(int id_tipodescuento, String nombretipodesc, String habilitado) {
        this.id_tipodescuento = id_tipodescuento;
        this.nombretipodesc = nombretipodesc;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "TipoDescuento{" + "id_tipodescuento=" + id_tipodescuento + ", nombretipodesc=" + nombretipodesc + '}';
    }

}

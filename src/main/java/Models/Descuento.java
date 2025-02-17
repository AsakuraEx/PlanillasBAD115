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
 * @author Juanjo
 */
@Entity
@Table(name = "Descuento")
public class Descuento {
    
    @Id
    @Column(name = "ID_DESCUENTO", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int ID_DESCUENTO;

    @Column(name="FECHADESCUENTO")
    LocalDate FECHADESCUENTO;
    
    @Column(name="FECHADESCUENTOFIN")
    LocalDate FECHADESCUENTOFIN;
    
    @Column(name="DESCUENTO")
    float DESCUENTO;
    
    @Column(name="ID_TIPODESCUENTO")
    int ID_TIPODESCUENTO;
    
    @Column(name="ID_EMPLEADO")
    int ID_EMPLEADO;

    @Column(name = "habilitado")
    private String habilitado;

    public Descuento() {
    }

    public Descuento(int ID_DESCUENTO, LocalDate FECHADESCUENTO,LocalDate FECHADESCUENTOFIN, float DESCUENTO, int ID_TIPODESCUENTO, int ID_EMPLEADO, String habilitado) {
        this.ID_DESCUENTO = ID_DESCUENTO;
        this.FECHADESCUENTO = FECHADESCUENTO;
        this.FECHADESCUENTOFIN=FECHADESCUENTOFIN;
        this.DESCUENTO = DESCUENTO;
        this.ID_TIPODESCUENTO = ID_TIPODESCUENTO;
        this.ID_EMPLEADO = ID_EMPLEADO;
        this.habilitado = habilitado;
    }

    @Override
    public String toString() {
        return "Descuento{" + "ID_DESCUENTO=" + ID_DESCUENTO + ", FECHADESCUENTO=" + FECHADESCUENTO +",FECHADESCUENTOFIN="+FECHADESCUENTOFIN+ ", DESCUENTO=" + DESCUENTO + ", ID_TIPODESCUENTO=" + ID_TIPODESCUENTO + ", ID_EMPLEADO=" + ID_EMPLEADO + ", habilitado=" + habilitado + '}';
    }

    public int getID_DESCUENTO() {
        return ID_DESCUENTO;
    }

    public void setID_DESCUENTO(int ID_DESCUENTO) {
        this.ID_DESCUENTO = ID_DESCUENTO;
    }

    public LocalDate getFECHADESCUENTO() {
        return FECHADESCUENTO;
    }

    public void setFECHADESCUENTO(LocalDate FECHADESCUENTO) {
        this.FECHADESCUENTO = FECHADESCUENTO;
    }

    public float getDESCUENTO() {
        return DESCUENTO;
    }

    public void setDESCUENTO(float DESCUENTO) {
        this.DESCUENTO = DESCUENTO;
    }

    public int getID_TIPODESCUENTO() {
        return ID_TIPODESCUENTO;
    }

    public void setID_TIPODESCUENTO(int ID_TIPODESCUENTO) {
        this.ID_TIPODESCUENTO = ID_TIPODESCUENTO;
    }

    public int getID_EMPLEADO() {
        return ID_EMPLEADO;
    }

    public void setID_EMPLEADO(int ID_EMPLEADO) {
        this.ID_EMPLEADO = ID_EMPLEADO;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public LocalDate getFECHADESCUENTOFIN() {
        return FECHADESCUENTOFIN;
    }

    public void setFECHADESCUENTOFIN(LocalDate FECHADESCUENTOFIN) {
        this.FECHADESCUENTOFIN = FECHADESCUENTOFIN;
    }

    
    
}

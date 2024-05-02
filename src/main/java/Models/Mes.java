package Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "mes")
public class Mes {
    @Id
    @Column(name = "id_mes", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "autoincremental_gen")
    @SequenceGenerator(name = "autoincremental_gen", sequenceName = "autoincremental", allocationSize = 1)
    private int id_mes;

    @Column(name = "mes")
    private String mes;

    public int getId_mes() {
        return id_mes;
    }

    public void setId_mes(int id_mes) {
        this.id_mes = id_mes;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public Mes() {
    }

    public Mes(int id_mes, String mes) {
        this.id_mes = id_mes;
        this.mes = mes;
    }

    @Override
    public String toString() {
        return "Mes{" + "id_mes=" + id_mes + ", mes=" + mes + '}';
    }
   
}

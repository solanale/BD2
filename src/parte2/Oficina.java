package parte2;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name="OFICINA_P1")
public class Oficina implements Serializable {

    public Oficina(Set<CCorriente> arrayCuentasC, Set<Operacion> arrayOperaciones, int codigo, String dir, int telefono) {
        this.arrayCuentasC = arrayCuentasC;
        this.arrayOperaciones = arrayOperaciones;
        this.codigo = codigo;
        this.dir = dir;
        this.telefono = telefono;
    }

    @OneToMany(mappedBy = "oficinaCuenta")
    private Set<CCorriente> arrayCuentasC;

    @OneToMany(mappedBy = "oficinaOperacion")
    private Set<Operacion> arrayOperaciones;

    @Id
    @Column(name = "CODIGO", nullable = false)
    private int codigo;

    @Column(name = "DIRECCION", length = 80)
    private String dir;

    @Column(name = "TELEFONO")
    private int telefono;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public Set<CCorriente> getArrayCuentasC() {
        return arrayCuentasC;
    }

    public void setArrayCuentasC(Set<CCorriente> arrayCuentasC) {
        this.arrayCuentasC = arrayCuentasC;
    }

    @Override
    public String toString() {
        return "Oficina{" +
                "codigo=" + codigo +
                ", dir='" + dir + '\'' +
                ", telefono=" + telefono +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Oficina oficina = (Oficina) o;

        return codigo == oficina.codigo;

    }

    @Override
    public int hashCode() {
        return codigo;
    }
}

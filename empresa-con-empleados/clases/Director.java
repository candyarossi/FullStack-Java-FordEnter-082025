package clases;

public class Director extends Gerente {
    // Atributos
    private double acciones;

    // Métodos
    public Director(String nombre, int id, double salarioBase, double bono, double acciones) {
        super(nombre, id, salarioBase, bono);
        this.acciones = acciones;
    }

    @Override
    public double calcularSalarioTotal() {
        return super.calcularSalarioTotal() + this.acciones;
    }

    @Override
    public String toString() {
        return super.toString() + ", Valor de las Acciones: " + this.acciones;
    }
}

package clases;

public class Gerente extends Empleado {
    // Atributos
    private double bono;

    // Métodos
    public Gerente(String nombre, int id, double salarioBase, double bono) {
        super(nombre, id, salarioBase);
        this.bono = bono;
    }

    @Override
    public double calcularSalarioTotal() {
        // return super.getSalarioBase() + this.bono;
        return super.calcularSalarioTotal() + this.bono;
    }

    @Override
    public String toString() {
        return super.toString() + ", Valor del Bono: " + this.bono;
    }
}

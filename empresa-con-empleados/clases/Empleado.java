package clases;

public class Empleado {
    // Atributos
    private String nombre;
    private int id;
    private double salarioBase;
    private final int horasTrabajadas = 160;

    // Métodos
    public Empleado(String nombre, int id, double salarioBase) {
        this.nombre = nombre;
        this.id = id;
        this.salarioBase = salarioBase;
    }

    public double getSalarioBase() {
        return salarioBase;
    }

    public double calcularSalarioTotal() {
        return salarioBase * horasTrabajadas;
    }

    @Override
    public String toString() {
        return "Información del Empleado: " + this.nombre + ", ID: " + this.id + ", Salario Base: " + this.salarioBase;
    }
}
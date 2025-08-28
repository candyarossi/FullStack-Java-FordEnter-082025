package clases;

public class Vehiculo {
    // Atributos
    private String marca;
    private String modelo;
    private int anio;

    // Método Constructor
    public Vehiculo(String marca, String modelo, int anio) {
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
    }

    // Método de Instancia
    public String despliegaInformacion() {
        return "Marca: " + this.marca + ", Modelo: " + this.modelo + ", Año: " + this.anio;
    }
}
package clases;

import java.util.ArrayList;

public class Garage {
    // Atributos
    private ArrayList<Vehiculo> vehiculos;
    private int capacidad;

    // Método Constructor
    public Garage(ArrayList<Vehiculo> vehiculos, int capacidad) {
        this.vehiculos = vehiculos;
        this.capacidad = capacidad;
    }

    public Garage(int capacidad) {
        this.vehiculos = new ArrayList<>();
        this.capacidad = capacidad;
    }

    // Métodos de Instancia
    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setVehiculos(ArrayList<Vehiculo> vehiculos) {
        this.vehiculos = vehiculos;
    }

    public ArrayList<Vehiculo> getVehiculos() {
        return vehiculos;
    }

    public boolean agregarVehiculo(Vehiculo vehiculo) {
        boolean confirmacion = false;

        if (this.capacidad > this.vehiculos.size()) {
            this.vehiculos.add(vehiculo);
            confirmacion = true;
        }

        return confirmacion;
    }

    public void mostrarVehiculos1() {
        // for
        for (int i = 0; i < this.vehiculos.size(); i++) {
            System.out.println(this.vehiculos.get(i).despliegaInformacion());
        }

        // for...of
        /*
         * for (Vehiculo vehiculo : this.vehiculos) {
         * System.out.println(vehiculo.despliegaInformacion());
         * }
         * 
         * // forEach
         * this.vehiculos.forEach(vehiculo ->
         * System.out.println(vehiculo.despliegaInformacion()));
         */
    }

    public String mostrarVehiculos2() {
        StringBuilder strVehiculos = new StringBuilder();

        for (int i = 0; i < this.vehiculos.size(); i++) {
            strVehiculos.append(this.vehiculos.get(i).despliegaInformacion()).append("\n");
        }

        return strVehiculos.toString();
    }
}

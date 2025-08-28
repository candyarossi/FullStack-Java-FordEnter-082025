
import clases.Garage;
import clases.Vehiculo;
import java.util.ArrayList;

public class Aplicacion {
    public static void main(String[] args) {
        Vehiculo v1 = new Vehiculo("Honda", "Civic", 2003);
        Vehiculo v2 = new Vehiculo("Toyota", "Hilux", 2011);
        Vehiculo v3 = new Vehiculo("Peugeot", "208", 2023);

        ArrayList<Vehiculo> vehiculos = new ArrayList<>();
        Garage g1 = new Garage(vehiculos, 2);

        Garage g2 = new Garage(2);

        /*
         * if(g2.getCapacidad() > g2.getVehiculos().size()){
         * g2.agregarVehiculo(v1);
         * }
         * 
         * if(g2.getCapacidad() > g2.getVehiculos().size()){
         * g2.agregarVehiculo(v2);
         * }
         */

        boolean agregarV1 = g2.agregarVehiculo(v1);
        mostrarMensajeAgregarVehiculo(agregarV1);

        boolean agregarV2 = g2.agregarVehiculo(v2);
        mostrarMensajeAgregarVehiculo(agregarV2);

        g2.mostrarVehiculos1();

        System.out.println(g2.mostrarVehiculos2());

        boolean agregarV3 = g2.agregarVehiculo(v3);
        mostrarMensajeAgregarVehiculo(agregarV3);
    }

    public static void mostrarMensajeAgregarVehiculo(boolean confirmacion) {
        if (confirmacion) {
            System.out.println("Vehiculo agregado");
        } else {
            System.out.println("Vehiculo no agregado");
        }
    }
}

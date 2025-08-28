import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ActividadFrutas {
    public static void main(String[] args) {

        // En esta clase define un Mapa de Hash llamado Frutas el cuál almacena como
        // clave un String (el nombre de la fruta) y como valor un entero (la cantidad a
        // comprar).
        HashMap<String, Integer> frutas = new HashMap<String, Integer>();

        // Agrega 5 frutas con sus respectivas cantidades al Mapa de Hash.
        frutas.put("Manzana", 5);
        frutas.put("Naranja", 2);
        frutas.put("Frutilla", 8);
        frutas.put("Kiwi", 3);
        frutas.put("Pera", 7);

        // Extrae la información de una fruta y despliega la información en consola
        // haciendo uso del método .get()
        System.out.println("Cantidad de Naranjas compradas: " + frutas.get("Naranja"));

        // A continuación despliega el listado completo de frutas. Mostrar el nombre de
        // la fruta seguido de su cantidad.
        Set<String> clavesFrutas = frutas.keySet();
        List<String> listaFrutas = new ArrayList<>(clavesFrutas);

        for (int i = 0; i < listaFrutas.size(); i++) {
            System.out.println(listaFrutas.get(i) + ": " + frutas.get(listaFrutas.get(i)));
        }
    }
}

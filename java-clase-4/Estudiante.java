
import java.util.ArrayList;
import java.util.Random;

public class Estudiante extends Usuario {
    private int nroLegajo;
    private String bootcamp;
    private String cohorte;
    public static ArrayList<Integer> legajos = new ArrayList<>();

    public Estudiante() {
        super();
        // usuario();

        this.nroLegajo = 0;
        this.bootcamp = "";
        this.cohorte = "";
    }

    public Estudiante(String nombre, String fechaNacimiento, String email, String bootcamp,
            String cohorte) {
        super(nombre, fechaNacimiento, email);
        this.nroLegajo = this.generarNroLegajo();
        this.bootcamp = bootcamp;
        this.cohorte = cohorte;
    }

    public int getNroLegajo() {
        return nroLegajo;
    }

    public String getBootcamp() {
        return bootcamp;
    }

    public void setBootcamp(String bootcamp) {
        this.bootcamp = bootcamp;
    }

    public String getCohorte() {
        return cohorte;
    }

    public void setCohorte(String cohorte) {
        this.cohorte = cohorte;
    }

    private int generarNroLegajo() {
        Random random = new Random();
        int nroRandom = 1000 + random.nextInt(9000); /* 1000 ... 9999 */
        if (Estudiante.legajos.contains(nroRandom)) {
            this.generarNroLegajo();
        }
        return nroRandom;
    }

    @Override
    public String toString() {
        return super.toString() + ", Nro Legajo: " + this.nroLegajo + ", Bootcamp: " + this.bootcamp + ", Cohorte: "
                + this.cohorte;
    }
}

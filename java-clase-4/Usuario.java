
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class Usuario {
    // Atributos (datos, información)
    private String nombre;
    private LocalDate fechaNacimiento;
    private int edad;
    private String email;
    public static int incrementId = 1;
    private int id;

    // Métodos (comportamiento, funciones)
    // Métodos Constructores
    public Usuario() {
        /*
         * this.nombre = "";
         * this.fechaNacimiento = LocalDate.now();
         * this.edad = 0;
         * this.email = "";
         */

        this("", "2025-08-28", "");
        // usuario()

        // this.nombre
        // usuario.nombre
    }

    public Usuario(String nombre, String fechaNacimiento, int edad) {
        /*
         * this.nombre = nombre;
         * this.edad = edad;
         * this.fechaNacimiento = this.formatearFecha(fechaNacimiento);
         * this.email = "";
         */

        this(nombre, fechaNacimiento, "");
    }

    public Usuario(String nombre, String fechaNacimiento) {
        /*
         * this.nombre = nombre;
         * this.fechaNacimiento = this.formatearFecha(fechaNacimiento);
         * this.edad = this.calcularEdad();
         * this.email = "";
         */

        this(nombre, fechaNacimiento, "");
    }

    public Usuario(String nombre, String fechaNacimiento, String email) {
        this.nombre = nombre;
        this.fechaNacimiento = this.formatearFecha(fechaNacimiento);
        this.edad = this.calcularEdad();
        this.email = email;
        this.id = Usuario.incrementId;
        Usuario.incrementId++;
    }

    // Getters y Setters
    // Get -> Acceder
    // Set -> Modificar
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = this.formatearFecha(fechaNacimiento);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public static int getIncrementId() {
        return incrementId;
    }

    // Métodos de Instancia
    private int calcularEdad() {
        Period diferencia = Period.between(this.fechaNacimiento, LocalDate.now());
        int edadCalculada = diferencia.getYears();
        return edadCalculada;
    }

    private int calcularEdad(String fechaNacimiento) {
        return 0;
    }

    private int calcularEdad(int anioNacimiento) {
        return 0;
    }

    private LocalDate formatearFecha(String fecha) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(fecha, formatter);
        return date;
    }

    @Override
    public String toString() {
        return "ID: " + this.id + ", Nombre: " + this.nombre + ", Fecha de Nacimiento: " + this.fechaNacimiento
                + ", Edad: " + this.edad + ", Email: " + this.email;
    }

    // Métodos Estáticos
}

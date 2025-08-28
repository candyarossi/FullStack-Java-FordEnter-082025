
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class Usuario {
    // Atributos (datos, información)
    private String nombre;
    private LocalDate fechaNacimiento;
    private int edad;

    // Métodos (comportamiento, funciones)
    // Métodos Constructores
    public Usuario() {
        this.nombre = "";
        this.fechaNacimiento = LocalDate.now();
        this.edad = 0;
    }

    public Usuario(String nombre, String fechaNacimiento, int edad) {
        this.nombre = nombre;
        this.edad = edad;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(fechaNacimiento, formatter);
        this.fechaNacimiento = date;
    }

    public Usuario(String nombre, String fechaNacimiento) {
        this.nombre = nombre;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(fechaNacimiento, formatter);
        this.fechaNacimiento = date;
        this.edad = this.calcularEdad();
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(fechaNacimiento, formatter);
        this.fechaNacimiento = date;
    }

    // Métodos de Instancia
    private int calcularEdad() {
        Period diferencia = Period.between(this.fechaNacimiento, LocalDate.now());
        int edadCalculada = diferencia.getYears();
        return edadCalculada;
    }

    @Override
    public String toString() {
        return "Nombre: " + this.nombre + ", Fecha de Nacimiento: " + this.fechaNacimiento + ", Edad: " + this.edad;
    }

    // Métodos Estáticos
}

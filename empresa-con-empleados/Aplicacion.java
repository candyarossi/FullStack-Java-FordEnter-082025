import clases.Director;
import clases.Empleado;
import clases.Gerente;

public class Aplicacion {
    public static void main(String[] args) {
        Empleado emp1 = new Empleado("Vicente", 1, 18000);
        System.out.println(emp1.toString() + ", Salario Total: " + emp1.calcularSalarioTotal());

        Gerente ger1 = new Gerente("Cristobal", 2, 20000, 12000);
        System.out.println(ger1.toString() + ", Salario Total: " + ger1.calcularSalarioTotal());

        Director dir1 = new Director("Benjamin", 3, 22000, 14000, 3000);
        System.out.println(dir1.toString() + ", Salario Total: " + dir1.calcularSalarioTotal());
    }
}

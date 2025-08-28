public class Application {
    public static void main(String[] args) {

        Usuario user1 = new Usuario();
        Usuario user2 = new Usuario("Candela", "1996-10-08", 18);
        Usuario user3 = new Usuario("Alejandro", "2002-12-03");

        Usuario user4 = new Usuario();
        user4.setNombre("Lucia");
        user4.setFechaNacimiento("2000-01-20");
        user4.setEdad(25);

        System.out.println("USER 1: " + user1.toString());
        System.out.println("USER 2: " + user2.toString());
        System.out.println("USER 3: " + user3.toString());
        System.out.println("USER 4: " + user4.toString());

        System.out.println("Nombre del USER 3: " + user3.getNombre());

    }
}
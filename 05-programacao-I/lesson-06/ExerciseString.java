public class ExerciseString {

    public static void main(String[] args) {

        String nome = "Chrystine";
        String nomeGuerra = "Chrystine";
        String sobrenome = new String("Martins");

        System.out.println(nome);
        System.out.println(sobrenome);

        if (nome == nomeGuerra) {

            System.out.println("Nome Iguais");

        } else {

            System.out.println("Nomes Diferentes");
        }

        if (nome == sobrenome) {

            System.out.println("Nome Iguais");

        } else {

            System.out.println("Nomes Diferentes");
        }

        System.out.println(nome.length());
        System.out.println(sobrenome.length());

    }

}

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Principal {

    public static void main(String[] args) throws IOException {

        Scanner teclado = new Scanner(System.in);
        String matricula;
        String nome;
        double teste, prova;
        int faltas;

        // para representar a contra barra, usamos 2 \\
        FileWriter arq = new FileWriter("C:\\Users\\chrys\\Downloads\\arquivox.txt");
        PrintWriter gravarArq = new PrintWriter(arq);

        System.out.println("Digite sua matricula: ");
        matricula = teclado.next();

        System.out.println("Digite seu nome: ");
        nome = teclado.next();

        System.out.println("Digite sua nota do teste: ");
        teste = teclado.nextDouble();

        System.out.println("Digite sua nota da prova: ");
        prova = teclado.nextDouble();

        System.out.println("Digite suas faltas: ");
        faltas = teclado.nextInt();

        gravarArq.println(matricula);
        gravarArq.println(nome);
        gravarArq.println(teste);
        gravarArq.println(prova);
        gravarArq.println(faltas);

        arq.close();

        System.out.println("Gravação efetuada com sucesso");

        teclado.close();

    }

}

import java.util.Scanner;

public class Exercise03 {

	public static void main(String[] args) {

		Scanner teclado = new Scanner(System.in);

		String matricula, nome, situacao, turma;
		double teste, prova, media;

		System.out.println("Digite a turma: ");
		turma = teclado.next();

        for (int i = 0; i < 3; i++) {

            System.out.println("Digite a matrícula: ");
            matricula = teclado.next();

            System.out.println("Digite o nome: ");
            nome = teclado.next();

            System.out.println("Digite o teste: ");
            teste = teclado.nextDouble();

            System.out.println("Digite a prova: ");
            prova = teclado.nextDouble();

            media = (teste + prova) / 2;

            System.out.println("Matrícula: " + matricula);
            System.out.println("Nome: " + nome);
            System.out.println("Média: " + media);
        }

        teclado.close();
	}
}

import java.util.Scanner;

public class Exercise02 {

	public static void main(String[] args) {

		Scanner teclado = new Scanner (System.in);
		String nome;
		
			
		System.out.println("Digite seu nome: ");
		nome = teclado.nextLine();
		//nome = teclado.next();
		
        System.out.println("Aluna " + nome);

       teclado.close();
	}
}

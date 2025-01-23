import java.util.Scanner;

public class Exercise04 {

	public static void main(String[] args) {
		
		int valor = 15;
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("Digite um valor:");
		valor = teclado.nextInt();
		
		System.out.println(valor / 2);
		System.out.println(valor % 2);
		
		teclado.close();
	}

}

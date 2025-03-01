import java.util.InputMismatchException;
import java.util.Scanner;

public class Principal3 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		int valor;

		try {

			System.out.println("Digite o denominador: ");
			valor = scanner.nextInt();

			int resultado = 3 / valor;
			System.out.println(resultado);

		} catch (ArithmeticException e) {

			System.out.println("ArithmeticException => " + e.getMessage());

		} catch (InputMismatchException e) {

			System.out.println("InputMismatchException =>" + e.getMessage());

		} catch (Exception e) {

			System.out.println("Exception => " + e.getMessage());
		}

		scanner.close();
	}

};
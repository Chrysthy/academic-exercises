import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		Integer dividendo = scanner.nextInt();
		Integer divisor = scanner .nextInt();
		
		
		try {
		
		Integer quociente = dividendo / divisor;
		System.out.println("Resultado " + quociente);
		
		} catch (Exception e) {
		
		System.out.println("Causa: " + e.getCause());
		System.out.println("Mensagem: " + e.getMessage());
		System.out.println("Tipo de Exceção: " + e.getClass().getCanonicalName());
		System.out.println("Ops! Não foi possível obter o resultado");

		}	
		
		scanner.close();
		
	}

}


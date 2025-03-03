
public class Principal {

	public static void main(String[] args) {

		try {
			ClasseFilha classeFilha = new ClasseFilha();
	
			classeFilha.executar();
			
		} catch (Exception e) {
			System.out.println("Erro");
		}

	}

}

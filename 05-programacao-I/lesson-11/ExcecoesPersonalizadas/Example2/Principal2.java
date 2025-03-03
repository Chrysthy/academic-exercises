
public class Principal2 {

	public static void main(String[] args) {
		
		try {
			
			throw new ExcecaoCustomizada("Minha Exceção");
			
		} catch (ExcecaoCustomizada e) {
			
			System.out.println(e);
			
		}

	}

}



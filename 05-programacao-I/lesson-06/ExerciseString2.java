public class ExerciseString2 {

	public static void main(String[] args) {
		
		//criado com atribuição
		String nome = "Chrystine";
		String nomeGuerra = "Chrystine";
		String sobrenome = new String("Chrystine");
		//criado instanciando explicitamente
		
		System.out.println(nome);
		System.out.println(sobrenome);
		
		
		
		if(nome.equals(nomeGuerra)) {
			
			System.out.println("Nome Iguais");
			
		} else {
			
			System.out.println("Nomes Diferentes");
		}
		
		
		if(nome.equals(sobrenome)) {
			
			System.out.println("Nome Iguais");
			
		} else {
			
			System.out.println("Nomes Diferentes");
		}
			

	}

}



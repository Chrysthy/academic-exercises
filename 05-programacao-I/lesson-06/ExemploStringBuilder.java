
public class ExemploStringBuilder {

	public static void main(String[] args) {
		
		String nome = "Chrystine";
		String sobreNome = "Martins";
		String nomeComBuffer;
		
	
		
		StringBuilder buffer = new StringBuilder();
		
		buffer.append(nome);
		buffer.append(sobreNome);
		
		nomeComBuffer = buffer.toString();
		
		System.out.println(nomeComBuffer);


	}

}

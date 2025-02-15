
public class ExemploStringBuffer {

	public static void main(String[] args) {
	
		String nome = "Chrystine";
		String sobreNome = "Martins";
		String nomeCompleto = nome + sobreNome;
		String nomeComBuffer;
		
	
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append(nome);
		buffer.append(sobreNome);
		
		nomeComBuffer = buffer.toString();
		
		//concatenando com +
		System.out.println(nomeCompleto);
		System.out.println(nomeComBuffer);
		//criação deuma vez só

	}

}


import java.util.HashMap;

public class Example1 {

	public static void main(String[] args) {
		
		HashMap<Integer, String> linguagensProgranacao = new HashMap<>();
		
		linguagensProgranacao.put(1, "C++");
		linguagensProgranacao.put(2, "Java");
		linguagensProgranacao.put(3,  "Cobol");
		
		System.out.println("Conteúdo do HashMap " + linguagensProgranacao);
		
		String valor = linguagensProgranacao.get(2);
		System.out.println("Elemento da chave 2: " + valor);
	}

}

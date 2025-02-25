import java.util.HashMap;

public class Example2 {

	public static void main(String[] args) {
		
		HashMap<Integer, String> linguagensProgranacao = new HashMap<>();
		
		linguagensProgranacao.put(1, "C++");
		linguagensProgranacao.put(2, "Java");
		linguagensProgranacao.put(3,  "Cobol");
		
		System.out.println("Conteúdo do HashMap " + linguagensProgranacao);
		
		
		System.out.println("Chaves: " + linguagensProgranacao.keySet());
		System.out.println("Valores: " + linguagensProgranacao.values());
		System.out.println("Chave/valor: " + linguagensProgranacao.entrySet());
	}

}

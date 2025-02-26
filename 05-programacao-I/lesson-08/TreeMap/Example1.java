import java.util.TreeMap;

public class Example1 {

	public static void main(String[] args) {

		TreeMap<String, String> mapaNomes = new TreeMap<>();

		mapaNomes.put("vava", "Oswaldo");
		mapaNomes.put("gisa", "Gisle");
		mapaNomes.put("gigi", "Giovana");
		mapaNomes.put("giugiu", "Giulianna");

		System.out.println("LinkedHashMap " + mapaNomes);
		
		
		System.out.println("Chaves: " + mapaNomes.keySet());
		System.out.println("Valores: " + mapaNomes.values());
		System.out.println("Chave/valor: " + mapaNomes.entrySet());

	}

}
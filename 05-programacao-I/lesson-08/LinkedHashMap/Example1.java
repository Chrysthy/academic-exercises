
import java.util.LinkedHashMap;

public class Example1 {

	public static void main(String[] args) {

		LinkedHashMap<String, String> listaNomes = new LinkedHashMap<>();

		listaNomes.put("vava", "Oswaldo");
		listaNomes.put("gisa", "Gisle");
		listaNomes.put("gigi", "Giovana");
		listaNomes.put("giugiu", "Giulianna");

		System.out.println("LinkedHashMap " + listaNomes);
		
		//creating a LinkedHashMap from other LinkedHashMap 	 
		LinkedHashMap<String, String> novaListaNomes = new LinkedHashMap<>(listaNomes);
		novaListaNomes.put("Jubis", "Jujuba");
		
		System.out.println("Nova LinkedHashMap " + novaListaNomes);

	}

}
import java.util.HashSet;

public class Collection {

	public static void main(String[] args) {

		HashSet<String> listaNomes = new HashSet<>();
		listaNomes.add("Chrystine");
		listaNomes.add("Noob");
		listaNomes.add("Leon");
		listaNomes.add("Collin");
		listaNomes.add("Pisguilo");
		listaNomes.add("Chrystine");
		
		for (String nome: listaNomes) {
			System.out.println(nome);

		}
		
			
	}

}

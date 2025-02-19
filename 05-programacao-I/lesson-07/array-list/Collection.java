import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Collection {

	public static void main(String[] args) {

		ArrayList<String> listaNomes = new ArrayList<>();
		listaNomes.add("Chrystine");
		listaNomes.add("Noob");
		listaNomes.add("Leon");
		listaNomes.add("Collin");
		listaNomes.add("Pisguilo");

		System.out.println("Antes");

		for (String nome: listaNomes) {
			System.out.println(nome);

		}

		
		
		listaNomes.set(1, "Frajolinha");
		
		System.out.println();
		System.out.println();
		
		
		System.out.println("Depois");
		
		for (String nome : listaNomes)
			System.out.println(nome);
	}

}

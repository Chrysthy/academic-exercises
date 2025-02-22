
import java.util.Vector;

public class CollectionExample {

	public static void main(String[] args) {

		Vector<String> listaNomes = new Vector<>();
		listaNomes.add("Chrystine");
		listaNomes.add("Noob");
		listaNomes.add("Leon");
		listaNomes.add("Collin");
		listaNomes.add("Pisguilo");


		for (String nome: listaNomes) {
			System.out.println(nome);

		}

		
	}

}

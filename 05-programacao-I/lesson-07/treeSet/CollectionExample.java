
import java.util.Iterator;
import java.util.TreeSet;

public class CollectionExample {

	public static void main(String[] args) {

		TreeSet<String> listaNomes = new TreeSet<>();
		listaNomes.add("Chrystine");
		listaNomes.add("Noob");
		listaNomes.add("Leon");
		listaNomes.add("Collin");
		listaNomes.add("Pisguilo");
	
		Iterator<String> iteracao = listaNomes.iterator();
		
		while (iteracao.hasNext()) {
			System.out.println(iteracao.next());

		}
		
			
	}

}

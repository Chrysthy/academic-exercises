
import java.util.LinkedList;
import java.util.List;

public class CollectionExample {

    public static void main(String[] args) {

        //ou LinkedList<String> listaNomes = new LinkedList<>();
                
		List<String> listaNomes = new LinkedList<>();
		listaNomes.add("Chrystine");
		listaNomes.add("Noob");
		listaNomes.add("Leon");
		listaNomes.add("Collin");
        listaNomes.add("Pisguilo");
        listaNomes.add(0, "Mileena");

		System.out.println("Antes");
		
		for (String nome: listaNomes) {
			System.out.println(nome);

		}
		
		listaNomes.set(1, "Frajolinha" );
		
		System.out.println();
		System.out.println();
		
		System.out.println("Depois");

		for (String nome: listaNomes) {
			System.out.println(nome);

		}
		
	}

}

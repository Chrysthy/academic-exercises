
import java.util.Iterator;
import java.util.LinkedHashSet;

public class CollectionExample3 {

	public static void main(String[] args) {

		LinkedHashSet<Integer> numeroLinkedHashSet = new LinkedHashSet<>();

		numeroLinkedHashSet.add(4);
		numeroLinkedHashSet.add(7);
		numeroLinkedHashSet.add(9);
		numeroLinkedHashSet.add(3);

		Iterator<Integer> iteracao = numeroLinkedHashSet.iterator();

		while (iteracao.hasNext()) {
			System.out.println(iteracao.next());
		}

	}

}

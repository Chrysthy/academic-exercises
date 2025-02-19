import java.util.ArrayList;
import java.util.Iterator;

public class Collection {

    public static void main(String[] args) {

        ArrayList<String> listaNome = new ArrayList<>();
        listaNome.add("Chrystine");
        listaNome.add("Noob");
        listaNome.add("Leon");
        listaNome.add("Collin");

        Iterator<String> iterator = listaNome.iterator();

        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }

}

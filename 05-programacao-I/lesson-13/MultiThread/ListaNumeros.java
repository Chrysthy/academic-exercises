
public class ListaNumeros {

    void printTable(int n) {

        for (int i = 1; i <= 4; i++) {

            System.out.println(n + i);

            try {

                Thread.sleep(300);
                // 300 milissegundos

            } catch (Exception e) {

                System.out.println(e);
            }
        }
    }

}

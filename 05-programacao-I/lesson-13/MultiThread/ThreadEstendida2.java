
public class ThreadEstendida2 extends Thread {

    ListaNumeros listaNumeros;

    public ThreadEstendida2(ListaNumeros listaNumeros) {

        this.listaNumeros = listaNumeros;
    }

    public void run() {
        listaNumeros.printTable(1000);
    }

}

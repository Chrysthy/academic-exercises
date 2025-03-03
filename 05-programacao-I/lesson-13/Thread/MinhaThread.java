
public class MinhaThread extends Thread {

    public void run() {

        System.out.println("Thread secundária");
    }

    public static void main(String[] args) {

        MinhaThread minhaThread = new MinhaThread();
        minhaThread.start();

        System.out.println("Thread principal");

    }

}

public class Exercise01 {

    public static void quicksort(int p, int q, int vetor[]) {
        int x;
        if (p < q) {
            x = particao(p, q, vetor);
            quicksort(p, x - 1, vetor);
            quicksort(x + 1, q, vetor);
        }
    }

    public static int particao(int p, int q, int vetor[]) {
        int j = p - 1;
        int temp, aux = vetor[q];

        for (int i = p; i <= q; i++) {
            if (vetor[i] <= aux) {
                j++;
                temp = vetor[i];
                vetor[i] = vetor[j];
                vetor[j] = temp;
            }
        }
        return j;
    }

    public static void main(String[] args) {
        int[] valores = {10, 3, 8, 15, 6, 1, 13, 9, 2};

        System.out.println("Antes da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }

        quicksort(0, valores.length - 1, valores);

        System.out.println("\nDepois da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }
    }
}

public class Exercise01 {

    public static void merge(int[] a, int inicio, int meio, int fim) { 
        int n = fim - inicio + 1;       
        int[] b = new int[n];

        int i1 = inicio;        
        int i2 = meio + 1;     
        int j = 0;            

        while (i1 <= meio && i2 <= fim) { 
            if (a[i1] < a[i2]) { 
                b[j] = a[i1];
                i1++;
            } else { 
                b[j] = a[i2];
                i2++;
            }
            j++;
        }

        while (i1 <= meio) { 
            b[j] = a[i1];
            i1++;
            j++;
        }

        while (i2 <= fim) { 
            b[j] = a[i2];
            i2++;
            j++;
        }

        for (j = 0; j < n; j++) {
            a[inicio + j] = b[j];
        }
    }

    public static void mergeSort(int[] a, int inicio, int fim) { 
        if (inicio >= fim) {
            return;
        }

        int meio = (inicio + fim) / 2;
        mergeSort(a, inicio, meio);
        mergeSort(a, meio + 1, fim);
        merge(a, inicio, meio, fim);
    }

    public static void main(String[] args) {
        int[] valores = {10, 3, 8, 15, 6, 1, 13, 9, 2};

        System.out.println("Antes da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }

        mergeSort(valores, 0, valores.length - 1);

        System.out.println("\nDepois da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }
    }
}

public class Exercise01 {

    
    public static void bolha(int numeros[])
    
    {
    
        final int n = numeros.length;
    
        int aux;
    
        for (int i = 0; i < n - 1; i++)
    
        {
    
            for (int j = 0; j < n - 1 - i; j++)
    
            {
    
                if (numeros[j] > numeros[j + 1])
    
                {
    
                    aux = numeros[j];
    
                    numeros[j] = numeros[j + 1];
    
                    numeros[j + 1] = aux;
    
                }
    
            }
    
        }
    
    }

    public static void main(String[] args) {
        int[] valores = {5, 2, 9, 1, 5, 6};

        System.out.println("Antes da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }

        bolha(valores);  

        System.out.println("\nDepois da ordenação:");
        for (int num : valores) {
            System.out.print(num + " ");
        }
    }
}

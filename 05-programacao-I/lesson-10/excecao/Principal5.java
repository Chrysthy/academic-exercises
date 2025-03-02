import java.util.Scanner;

public class Principal5 {

    public static void main(String[] args) {

        try (Scanner teclado = new Scanner(System.in)) {
            int opcao;

        do {
            System.out.println("Digite o número 1 ou 2:");
            System.out.println();

            try {

                opcao = teclado.nextInt();

                switch (opcao) {
                    case 1:
                        System.out.println("Você digitou a opção " + opcao);
                        break;

                    case 2:
                        System.out.println("Você digitou a opção " + opcao);
                        break;

                    default:
                        throw new IllegalArgumentException("Erro: Opção inválida. Digite 1 ou 2.");
                }

            } catch (IllegalArgumentException excecao) {
                System.out.println(excecao.getMessage());
            } catch (Exception e) {
                System.out.println("Erro inesperado: " + e.getMessage());
                teclado.nextLine(); // Limpar o buffer do scanner em caso de erro
            } finally {
                System.out.println("--------------------------");
            }

        } while (true);
        
        }
      
    } 
    
}
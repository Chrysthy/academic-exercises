import java.io.File;
import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		
		Scanner teclado = new Scanner(System.in);
		
		//print f é para formatar as saídas
		System.out.printf("Digite o nome do arquivo com o seu path:");
		String nome = teclado.next();
		
		File objFile = new File(nome);
		
		if (objFile.exists()) {
			
			if(objFile.isFile()) {
				
				System.out.println("Nome do arquivo: " + objFile.getName());
				System.out.println("Tamanho do arquivo: " + objFile.length());
			}
			
        } else {
            System.out.println("Arquivo inexistente");
        }

        teclado.close();
	}

}

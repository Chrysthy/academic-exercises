import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


public class Principal {

	public static void main(String[] args) {
		
		String nome = "C:\\Users\\chrys\\Downloads\\arquivox.txt";
		
		System.out.printf("Conteúdo do arquivo texto: ");
		
		try {
			
			FileReader arq = new FileReader(nome);
			BufferedReader lerArq = new BufferedReader(arq);
			//lê todos od dados das linhas
			
			
			String linha = lerArq.readLine(); //lê a primeira linha
			
			while (linha != null) {
				
				System.out.println(linha);
				linha = lerArq.readLine(); //lê da segunda linha até a última
				
			}

			arq.close();
			lerArq.close();
			
		} catch (IOException e) {
			
			System.out.printf("Erro na abertura do arquivo: %s.\n ", e.getMessage());
			
		}
		
		System.out.println();	

	}

}

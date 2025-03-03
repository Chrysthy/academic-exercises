
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class Principal {

	public static void main(String[] args) throws FileNotFoundException, IOException {

		Scanner teclado = new Scanner(System.in);
		String matricula;
		String nome;
		double teste, prova;
		int faltas;

		
		FileOutputStream arq = new FileOutputStream("C:\\Users\\chrys\\Downloads\\arquivox.txt");
		DataOutputStream gravarArq = new DataOutputStream(arq);

		System.out.println("Digite sua matricula: ");
		matricula = teclado.next();

		System.out.println("Digite seu nome: ");
		nome = teclado.next();

		System.out.println("Digite sua nota do teste: ");
		teste = teclado.nextDouble();

		System.out.println("Digite sua nota da prova: ");
		prova = teclado.nextDouble();

		System.out.println("Digite suas faltas: ");
		faltas = teclado.nextInt();
		
		
		gravarArq.writeUTF(matricula);
		gravarArq.writeUTF(nome);
		gravarArq.writeDouble(teste);
		gravarArq.writeDouble(prova);
		gravarArq.writeInt(faltas);
			
		
		arq.close();
		
		System.out.println("Gravação efetuada com sucesso");
		
		teclado.close();
		
		
	}

}


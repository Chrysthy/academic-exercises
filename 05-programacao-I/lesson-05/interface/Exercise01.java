
public class Exercise01 {

	public static void main(String[] args) {

	AlunoEnsimoMedio alunoEnsimoMedio = new AlunoEnsimoMedio();
;
	AlunoEnsimoSuperior alunoEnsimoSuperior = new AlunoEnsimoSuperior();
			
		alunoEnsimoMedio.nome = "Noob";
		alunoEnsimoMedio.teste = 8;
		alunoEnsimoMedio.prova = 9;
		
		System.out.println("Aluno Ensino Médio");
		System.out.println("Nome: " + alunoEnsimoMedio.nome);
		System.out.println("Média: " + alunoEnsimoMedio.getMedia());
	
		
	
		alunoEnsimoSuperior.nome = "Leon";
		alunoEnsimoSuperior.teste = 8;
		alunoEnsimoSuperior.prova = 9;
		
		System.out.println("Aluno Ensino Superior");
		System.out.println("Nome: " + alunoEnsimoSuperior.nome);
		System.out.println("Média: " + alunoEnsimoSuperior.getMedia());

}
	

}
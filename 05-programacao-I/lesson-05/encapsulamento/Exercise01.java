
public class Exercise01 {

	public static void main(String[] args) {

		Aluno aluno = new Aluno();
		
		aluno.setNome("Chrystine");
		aluno.teste = 9;
		aluno.prova = 10;
		
		System.out.println(aluno.getNome());
		System.out.println(aluno.getMedia());

	}

}

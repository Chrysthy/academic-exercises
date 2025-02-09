
public abstract class Aluno extends Pessoa implements Media{

	double teste, prova;

	public double getTeste() {
		return teste;
	}

	public void setTeste(double teste) {
		this.teste = teste;
	}

	public double getProva() {
		return prova;
	}

	public void setProva(double prova) {
		this.prova = prova;
	}
	
	abstract double getMedia();
	
}


public class Aluno extends Pessoa {

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



	double getMedia() {
		return (teste + prova) / 2;
	}
	
}


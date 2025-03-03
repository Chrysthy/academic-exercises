
public class ExcecaoCustomizada2 extends Exception {

    String mensagem;

    public ExcecaoCustomizada(String str) {

        mensagem = str;

    }

    public String toString() {

        return ("Exceção customizada: " + mensagem);
    }

}

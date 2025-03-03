
public class ExcecaoCustomizada extends Exception {

    String mensagem;

    public ExcecaoCustomizada(String str) {

        mensagem = str;

    }

    public String toString() {

        return ("Exceção customizada: " + mensagem);
    }

}

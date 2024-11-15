import javax.swing.*;

public class AtividadePratica {
    public static void main(String[] args) {

        int n1, n2;
        double quo, pot;
        String msg;

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro:"));

        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro número inteiro:"));

        quo = (double) n1 / n2;

        pot = Math.pow(n1, n2);

        msg = "Resultado do quociente dos dois numero informados: " + quo + "\n" + "Resultado da potencia entre os dois numeros: " + pot;

        JOptionPane.showMessageDialog(null, msg,  "O resultado é: ", JOptionPane.INFORMATION_MESSAGE);

        System.exit(0);
    }
}

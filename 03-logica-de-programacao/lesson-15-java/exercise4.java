import javax.swing.*;

class Prog06 {
    public static void main(String entrada[]) {

        int n1, n2, p = 0;
        char op = 0;
        String msg = "", msgEntr = "Digite 1 para produto\nDigite 2 para produtória\n";

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro"));

        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro número inteiro"));

        op = JOptionPane.showInputDialog(msgEntr).charAt(0);

 
    }
}
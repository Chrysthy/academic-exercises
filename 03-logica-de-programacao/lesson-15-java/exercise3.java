import javax.swing.*;

class Exercise3 {
    public static void main(String entrada[]) {

        int n1, n2, soma = 0;
        char op = 0;
        String msg = "", msgEntr = "Digite 1 para adicao/subtracao\nDigite 2 para somatoria\n";

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro"));

        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro número inteiro"));

        op = JOptionPane.showInputDialog(msgEntr).charAt(0);

 
    }
}
import javax.swing.*;

class Exercise3 {
    public static void main(String entrada[]) {

        int n1, n2, soma = 0;
        char op = 0;
        String msg = "", msgEntr = "Digite 1 para adicao/subtracao\nDigite 2 para somatoria\n";

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro"));

        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro número inteiro"));

        op = JOptionPane.showInputDialog(msgEntr).charAt(0);

        switch (op) {
            case '1':

                if (n1 % 2 == 0 && n2 % 2 == 0) {

                    soma = n1 + n2;
                    msg = msg + "A soma de: " + n1 + " por " + n2 + " = " + soma + "\n\n";
                }

                break;

            case '2':

                for (int i = n1; i <= n2; i = i + 1) {
                    soma = soma + n1;
                }

                msg = msg + "A somatória de " + n1 + ", " + n2 + " vezes é " + soma + "\n\n";

                break;

            default:
                JOptionPane.showMessageDialog(null, "Opção inválida");
        }

        if (op >= '1' && op <= '3') {

            JOptionPane.showMessageDialog(null, msg);
        }

        System.exit(0);
    }
}
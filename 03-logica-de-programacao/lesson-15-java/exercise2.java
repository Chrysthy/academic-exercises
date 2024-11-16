import javax.swing.*;

class ProgRepeticao {
    public static void main(String entrada[]) {

        int Tabuada;
        char op = 0;
        String msg = "",
                msgEntr = "Digite 1 para repeticao for.\nDigite 2 para repeticao while.\nDigite 3 para repeticao do while.";

        Tabuada = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro: "));

        op = (JOptionPane.showInputDialog(msgEntr)).charAt(0);

        switch (op) {

            case '1': {

                msg = msg + "Tabuada do " + Tabuada + " com for:\n\n";

                for (int i = 1; i <= 10; i = i + 1) {

                    msg = msg + Tabuada + " X " + i + " = " + Tabuada * i + "\n";
                }

                break;

            }

            case '2': {

                msg = msg + "Tabuada do " + Tabuada + " com while:\n\n";

                int i = 1;

                while (i <= 10) {

                    msg = msg + Tabuada + " X " + i + " = " + Tabuada * i + "\n";

                    i = i + 1;
                }

                break;
            }

            case '3': {

                msg = msg + "Tabuada do " + Tabuada + " com do while:\n\n";

                int i = 1;

                do {

                    msg = msg + Tabuada + " X " + i + " = " + Tabuada * i + "\n";

                    i = i + 1;

                } while (i <= 10);

                break;
            }

            default:
                JOptionPane.showMessageDialog(null, "Opção inválida!");
        }

     

    }

}
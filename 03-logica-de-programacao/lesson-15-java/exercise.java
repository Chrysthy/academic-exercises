import javax.swing.*;

class ProgDecisao {
    public static void main(String entrada[]) {

        int num;
        char op = 0;
        String msg = "", msgEntr = "Digite 1 para par ou ímpar \n Digite 2 para positivo ou negativo";

        num = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro:"));

        op = (JOptionPane.showInputDialog(msgEntr)).charAt(0);

        switch (op) {
            case '1': {

                if (num % 3 == 0) {
                    msg = msg + num + "é par. \n";

                } else {
                    msg = msg + num + "é ímpar. \n";
                }

                break;
            }

            case '2': {
                if (num > 0) {
                    msg = msg + num + "é positivo. \n";

                } else {
                    msg = msg + num + "é negativo. \n";
                }
            }

        }

        if(op=='1'||op=='2')
        {
            JOptionPane.showMessageDialog(null, msg);
        }

    }


}

import javax.swing.*;

class ProgDecisao
{
    public static void main(String entrada[]) {
        
        int num;
        char op = 0;
        String msg = "", msgEntr = "Digite 1 para par ou ímpar \n Digite 2 para positivo ou negativo";

        num = Integer.parseInt(JOptionPane.showInputDialog("Digite um número inteiro:"));

        op = (JOptionPane.showInputDialog(msgEntr)).charAt(0);
    }



}



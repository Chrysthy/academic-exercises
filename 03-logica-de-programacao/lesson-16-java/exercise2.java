import javax.swing.*;

class ProgMod {

    public static void soma() {
        int n1, n2;

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um número: "));
        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro número: "));

        JOptionPane.showMessageDialog(null, "A soma é: " + (n1 + n2));

    }


}
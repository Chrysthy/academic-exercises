import javax.swing.*;

class ProgMatriz {
    public static void main(String entrada[])

    {

        int vetor[] = { 2, 4, 6, 8, 10 };
        int matriz[][] = new int[2][3];
        String msg = "vetor = ";

        for (int i = 0; i < vetor.length; i++) {

            msg = msg + vetor[i] + " ";
        }

        JOptionPane.showMessageDialog(null, msg);

    }
}
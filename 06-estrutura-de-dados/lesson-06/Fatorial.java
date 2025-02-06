//recursão com cauda

import javax.swing.JOptionPane;

class Fatorial {

   static int fatTailRec(int n, int acumulador) {
      if (n == 0 || n == 1) {
         return acumulador;
      }
      return fatTailRec(n - 1, n * acumulador);
   }

   static int fat(int n) {
      return fatTailRec(n, 1);
   }

   public static void main(String[] args) {
      int nro;

      nro = Integer.parseInt(JOptionPane.showInputDialog("Digite um valor que você deseja saber o fatorial"));

      if (nro < 0) {
         System.out.println("Valor inválido para cálculo de fatorial, o valor precisa ser maior ou igual a zero");
         System.exit(0);
      } else {
         int resultado = fat(nro);
         System.out.println("O fatorial de " + nro + " é " + resultado);
      }

      System.exit(0);
   }
}

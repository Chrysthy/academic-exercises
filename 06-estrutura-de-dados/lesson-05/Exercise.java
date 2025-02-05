//recursão sem cauda

import javax.swing;

 

class FatorialP {

  static void fatP (int n, int x, int f)

    {

      if (x == 0 || x == 1)  {

          System.out.println("O fatorial de " + n + " é " + f); // regra 1

        }

      else

        {

          // chamada da função recursiva

          fatP(n, x-1, fx); // regra 2 e 3

        }

    }

public static void main (String arg [ ])

        {

            int nro;

 

            nro = Integer.parseInt(JOptionPane.showInputDialog(“Digite um valor que você deseja saber o fatorial”));

            if (nro < 0)

               {

                  System.out.println (“Valor inválido para cálculo de fatorial, o valor precisa ser maior ou igual a zero”);

                  System.exit(0);

               }

            else

               {

                  fatP(nro, nro, 1); // chamada da função recursiva

               }

            System.exit(0);

         }

   }

 
 
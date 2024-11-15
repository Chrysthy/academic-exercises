class Programa01 {
    public static void main(String entrada[])

    {
        int NumInt;
        double NumReal, soma;
        char Caractere;

        NumInt = Integer.parseInt(entrada[0]);
        NumReal = Double.parseDouble(entrada[1]);
        Caractere = entrada[2].charAt(0);

        soma = (double) NumInt + NumReal;

        System.out.println((double) NumInt + " + " + NumReal + " = " + soma + " sinal " + Caractere);

        System.exit(0);

    }
}

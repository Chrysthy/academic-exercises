public int Desenfileirar () {

    int desenfileirado = 0;

    if (FilaVazia()) {

        System.out.println("Fila Vazia");

    } else {

        desenfileirado = vetor[inicio];
        inicio = inicio + 1;
        total = total -1;

        if (inicio >= tamanho) {

            inicio = 0;

        }


    }

    return desenfileirado;

}
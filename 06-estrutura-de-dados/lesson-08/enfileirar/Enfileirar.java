public void Enfileirar (int elemento) {

    if (!FilaCheia()) {

        vetor[fim] = elemento;
        fim = fim + 1;
        total = total + 1;

        if (fim >= tamanho) {

            fim = 0;

        }


    } else {

        System.out.println("Fila Cheia");
    }

}
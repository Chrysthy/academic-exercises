public void MostraFila() {

    int i, aux;

    aux = inicio;

    for (i = 1; i <= total; i++) {

        JOptionPane.showMessageDialog(null, "Elemento " + vetor[aux] + "posição " + i);

        aux = aux + 1;

        if (aux >= tamanho) {

            aux = 0;
        }

    }

}
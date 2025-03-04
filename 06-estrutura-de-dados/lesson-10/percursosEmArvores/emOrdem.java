emOrdem (BIntNo ABB) {

    if (ABB != null) {

        emOrdem(ABB.esquerda);

        visita(ABB); // é um método que mostra as informações do nó

        emOrdem(ABB.direita);

    }

}
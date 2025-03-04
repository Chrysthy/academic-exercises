preOrdem (BIntNo ABB){

    if (ABB != null){    

    visita(ABB); // é um método que mostra as informações do nó

    preOrdem(ABB.esquerda);

    preOrdem(ABB.direita);

    }

}
posOrdem (BIntNo ABB)

{

    if (ABB != null) {

        posOrdem(ABB.esquerda);

        posOrdem(ABB.direita);

        visita(ABB); // é um método que mostra as informações do nó

    }

}

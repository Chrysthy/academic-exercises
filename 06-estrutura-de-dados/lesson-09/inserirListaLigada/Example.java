public void InserirMeio (No NovoNo, int posicao) {

    No NoTemp = primeiro;
    int NroNos, posAux = 1;

    NroNos = ContarNos();

    if(posicao <= 1 ) {

        InserirInicio(NovoNo);

    } else {

        if (posicao > NroNos) {

            InserirFinal(NovoNo);
            
        } else {

            while (posAux < (posicao - 1)) {

                NoTemp = NoTemp.prox;
                posAux = posAux + 1;

            }

            NovoNo.prox = NoTemp.prox;
            NoTemp.prox = NovoNo;

        }


    }







}
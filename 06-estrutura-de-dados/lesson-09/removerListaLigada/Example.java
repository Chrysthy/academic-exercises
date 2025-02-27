public void Remover (int elemento) {

    No NoTemp = primeiro;
    No NoAnt = null;

    if( primeiro.elemento === elemento) {

        primeiro = primeiro.prox;
        
    } else {

        while (NoTemp != null && NoTemp.elemento != elemento) {

            NoAnt = NoTemp;
            NoTemp = NoTemp.prox;
            
        }

        if (NoTemp != null) {

            NoAnt.prox = NoTemp.prox;

        } 

        if (NoTemp == ultimo) {

            ultimo = NoAnt

        }


    }



}
public No BuscarNo (int elemento) {

    int i = 1;
    No NoTemp = primeiro;

    while (NoTemp != null) {

        if (NoTemp.elemento == elemento) {

            System.out.println("No " + NoTemp.elemento + " posição " + i);

            return NoTemp;

        }

        i = i +1;
        NoTemp = NoTemp.prox;


    }

    return null;

}
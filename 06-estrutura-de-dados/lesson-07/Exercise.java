
public boolean PilhaVazia() {

    if (topo == -1) {
        return true;

    } else {
        return false;
    }
}

public boolean PilhaCheia() {

    if (topo >= tamanho -1) {
        return true;

    } else {
        return false;
    }
}

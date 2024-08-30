//Herança
class DispositivoEletronico {

    constructor(nome) {

        this.nome = nome;
        this.ligado = false;

    }

    ligar() {

        if (this.ligado) {

            console.log("Já está ligado");

            return;


        };

        this.ligado = true;

    };

};

//extends = tudo que tem no DispositivoEletronico, vai aproveirar no SmartPhone
//precisa set o constructor do DispositivoEletronico, usando a palavra super
class SmartPhone extends DispositivoEletronico {

    constructor(nome, cor, modelo) {

        super(nome);

    }

}
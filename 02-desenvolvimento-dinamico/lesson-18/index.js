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
        this.cor = cor;
        this.modelo = modelo;

    };

};

var s1 = new SmartPhone("Samsung", "Preto", "A71");
console.log(s1);

s1.ligar();
s1.ligar();
//precisar chamar duas vezes, porque a primeira vez não está ligado
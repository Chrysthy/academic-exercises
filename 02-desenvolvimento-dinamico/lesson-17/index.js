//Class
//criação de classe 
//para criar um objeto na classe, precisa do constructor
//a função é o nosso método

class pessoa {

    constructor(nome, sobrenome) {

        this.nome = nome;
        this.sobrenome = sobrenome;

    }

    falar() {

        console.log("Olá " + this.nome);


    }

};

p1 = new pessoa("Chrystine", "Martins");
p1.falar()
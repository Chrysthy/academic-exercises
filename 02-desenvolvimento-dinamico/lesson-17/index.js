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

    get nomeCompleto() {

        console.log("Olá " + this.nome + this.sobrenome);

    }

};

p1 = new pessoa("Chrystine", "Martins");
p1.falar();

p1.nomeCompleto;
//não precisa usar o parênteses para chamar o get
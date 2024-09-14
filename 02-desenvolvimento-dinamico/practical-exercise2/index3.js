class Funcionario {

    constructor(nome, idade, cargo) {

        this.nome = nome;
        this.idade = idade;
        this.cargo = cargo;
    }

    seApresentar() {

        console.log(`Olá, eu sou ${this.nome}, tenho ${this.idade} anos e meu cargo na empresa é de ${this.cargo}.`);

    };

    trabalhar() {

        console.log(`${this.nome} está trabalhando.`);

    };
};



class Gerente extends Funcionario {

    constructor(nome, idade, cargo, departamento) {

        super(nome, idade, cargo);
        this.departamento = departamento;
    };

    gerenciar() {

        console.log(`${this.nome} está gerenciando o departamento ${this.departamento}.`);
    };

};

class Desenvolvedor extends Funcionario {

    constructor(nome, idade, cargo, linguagem) {

        super(nome, idade, cargo);
        this.linguagem = linguagem;

    };

    programar() {

        console.log(`${this.nome} está programando em ${this.linguagem}.`);

    };

};

const gerente1 = new Gerente('Chrystine Martins', 32, 'Gerente', 'TI');
const desenvolvedor1 = new Desenvolvedor('Noob Saibot', 18, 'Desenvolvedor', 'JavaScript');

gerente1.seApresentar();
gerente1.trabalhar();
gerente1.gerenciar();

desenvolvedor1.seApresentar();
desenvolvedor1.trabalhar();
desenvolvedor1.programar();
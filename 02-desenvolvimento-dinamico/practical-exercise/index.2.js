/*

Imagine que você está desenvolvendo um sistema para uma empresa que possui diferentes tipos de funcionários, como gerentes e desenvolvedores. Seu objetivo é implementar o código em JavaScript que modele essa situação utilizando classes e herança.

Você precisa criar as classes Funcionario, Gerente e Desenvolvedor. A classe Funcionario deve ter os atributos nome, idade e cargo, além dos métodos seApresentar() e trabalhar(). A classe Gerente deve herdar da classe Funcionario e ter um atributo adicional departamento, além do método gerenciar(). Já a classe Desenvolvedor deve herdar da classe Funcionario e ter um atributo adicional linguagem, além do método programar().

Depois de implementar as classes, crie instâncias de um gerente e de um desenvolvedor, definindo valores para seus atributos. Em seguida, chame os métodos apropriados para cada um dos funcionários, exibindo as saídas corretas no console.

*/

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
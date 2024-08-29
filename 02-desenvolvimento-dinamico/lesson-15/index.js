//Objetos
//1 - forma de criar objetos

const pessoa = {

    nome: 'Chrystine',
    sobrenome: 'Martins'

}

console.log(pessoa['sobrenome']);


//2 - forma de criar objetos
const funcionario = new Object();
funcionario.nome = 'Noob';
funcionario.sobrenome = 'Saibot';

console.log(funcionario.nome);


//3 - forma de criar objetos
function criarPessoa(nome, sobrenome, i) {

    return {

        nome,
        sobrenome,
        idade = i,

        //se tirar o get, na hora de chamar será diferente
        get nomeCompleto() {

            return `${this.nome} ${this.sobrenome}`

        }

    };

};

const p1 = criarPessoa("Chrystine", "Martins", 32);
const p2 = criarPessoa("Noob", "Saibot", 14);

console.log(p1);
console.log(p2);

console.log(p1.nome);
console.log(p2.sobrenome);

console.log(p1.nomeCompleto);
console.log(p2.nomeCompleto);

//se não tiver o get, terá que chamar como função
//console.log(p1.nomeCompleto());


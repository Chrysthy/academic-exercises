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
function criarPessoa(nome, sobrenome) {

    return { nome, sobrenome };

};

const p1 = criarPessoa("Chrystine", "Martins");
const p2 = criarPessoa("Noob", "Saibot");
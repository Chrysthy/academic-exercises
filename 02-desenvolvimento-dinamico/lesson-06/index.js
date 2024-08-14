//FILTER
var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
var resultado = numeros.filter(i => i % 2 == 0);

console.log(resultado);

//FORMA 2
var numerosFiltrados = numeros.filter(

    function (valor) {
        return valor > 5;
    }
)

console.log(numerosFiltrados);

//FORMA 3
function buscarValores(valor) {
    return valor < 5;
}

var numerosEncontrados = numeros.filter(buscarValores);

console.log(numerosEncontrados);


var r1 = numeros.filter((valor) => {
    return valor > 5
});

var r2 = numeros.filter(valor => valor > 5);


var funcionarios = [
    {
        nome: 'Chrystine',
        idade: 32
    },

    {
        nome: 'Noob',
        idade: 14
    },

    {
        nome: 'Leon',
        idade: 4
    },

    {
        nome: 'Collin',
        idade: 4
    }

]

var pessoasListadas = funcionarios.filter(
    function (valor) {
        return valor.nome.length < 5;

    }

)

console.log(pessoasListadas);


var produtos = [
    {
        id: 1,
        descricao: 'SmartPhone',
        categoria: 'Eletronico'
    },

    {
        id: 2,
        descricao: 'Notebook',
        categoria: 'Eletronico'
    },

    {
        id: 3,
        descricao: 'Geladeira',
        categoria: 'Eletrodomestico'
    },

    {
        id: 4,
        descricao: 'Fogão',
        categoria: 'Eletrodomestico'
    }

]

var eletronicos = produtos.filter((item) => {
    return item.categoria == 'Eletronico'
})

console.log(eletronicos);

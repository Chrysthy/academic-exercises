//arrays
var valores = [8, 1, 7, 2, 9];

console.log(valores[0]);

//INTERAÇÃO DOS ELEMENTOS 
for (var i = 0; i < valores.length; i++) {

    console.log(`Posição ${i} - Valor ${valores[i]}`);

}

var carros = [];
carros[0] = "Volvo";
carros[1] = "Jeep";


var motos = new Array("BMW", "Yamaha", "Honda");


//calcular a média de todos os números de um array
var soma = 0;

for (var i = 0; i < valores.length; i++) {

    soma += valores[i]

}

var media = soma / valores.length;

console.log(media);

//MÉTODOS DE ARRAYS
var valores2 = [1, 2, 3, 4, 5, 6];
var valorRetirado = valores2.shift();

console.log(`Array invertido: ${valores2.reverse()}`);

console.log(valores2.join('|'));

console.log(valores2.pop());

console.log(valorRetirado);

console.log(valores2);

console.log(`Posição do número 3: ${valores2.indexOf(3)}`);

console.log(valores2.push(7));


//Criar um novo array somente com números positivos
var array = [-5, 10, 15, 20, -3, 89]
var positivos = [];

for (var i = 0; i < array.length; i++) {

    if (array[i] > 0) {
        positivos.push(array[i])
    }
}

console.log(positivos);


//SPLICE
var valores3 = [1, 2, 3, 4, 5, 6, 7];

valores3.splice(2, 3);

console.log(valores3);


var nomes = ['Chrystine', 'Leon', 'Noob', 'Collin'];
var novos = nomes.splice(1, 2, 'Mileena', 'Frost');

console.log(nomes);
console.log(novos);


var pais = ['Brasil', 'Argentina', 'Colombia'];

pais.unshift('Uruguai')

console.log(pais);

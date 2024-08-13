//arrays
var valores = [8, 1, 7, 2, 9];

console.log(valores[0]);

//INTERAÇÃO DOS ELEMENTOS 
for (var i=0; i < valores.length; i++){

    console.log(`Posição ${i} - Valor ${valores[i]}`);

}

var carros = [];
carros[0] = "Volvo";
carros[1] = "Jeep";


var motos = new Array("BMW", "Yamaha", "Honda");


//calcular a média de todos os números de um array
var soma = 0;

for (var i=0; i < valores.length; i++){

    soma += valores[i]

}

var media = soma/valores.length;

console.log(media);

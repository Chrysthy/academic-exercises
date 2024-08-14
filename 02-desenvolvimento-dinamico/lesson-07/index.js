//REDUCE
var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

var total = numeros.reduce(

    function (total, numero) {

        return total + numero

    }, 0);

console.log(total);


//FOREACH
var a = [10, 20, 30, 40, 50, 60];

for (let valor of a) {
    console.log(valor);

};

a.forEach(valor => console.log(valor));


var total = 0;

a.forEach(valor => {
    total += valor
})

console.log(total);


a.forEach(function (valor, indice, array) {
    console.log(array[indice]);

})

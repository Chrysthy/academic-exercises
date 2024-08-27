//function
function multiplicar(x, y) {
    return x * y;
}

console.log(multiplicar(2, 2));

var a = multiplicar(4, 2);
var b = multiplicar(6, 7);

console.log(a);
console.log(b);

function somaValores(a, b = 2, c = 6) {
    var total = a + b + c;

    return total
}

var f = somaValores(8, 4, 5);
console.log(f);



//função anônima
var infoCal = function (a, b, c) {
    return a + b + c
};

console.log(infoCal(2, 2, 2));


//arrow function
const sum = (num1, num2) => {
    return num1 + num2;
};

console.log(sum(4, 4));

const numeros = [1, 2, 3, 4, 5];
const valores = numeros.map((num) => num * num);

console.log(valores);


var listaProdutos = ['geladeira', 'fogão', 'air fryer'];
var listaEmMaiuscula = listaProdutos.map(primeiraEmMaiuscula);

function primeiraEmMaiuscula(elemento) {
    return elemento.charAt(0).toUpperCase() + elemento.slice(1);
}
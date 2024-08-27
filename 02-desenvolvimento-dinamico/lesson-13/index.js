//function
function multiplicar(x, y) {
    return x * y;
}

console.log(multiplicar(2, 2));

var a = multiplicar(4, 2);
var b = multiplicar(6,7);

console.log(a);
console.log(b);

function somaValores (a, b = 2, c = 6) {
    var total = a + b + c;

    return total
}

var f = somaValores (8,4,5);
console.log(f);



//função anônima
var infoCal = function (a, b, c) {
    return a + b + c
};

console.log(infoCal(2, 2, 2));


//arrow function
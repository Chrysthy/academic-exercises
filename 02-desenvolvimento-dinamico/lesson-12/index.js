//STRING METHODS
//LENGTH
var nome = 'Chrystine Martins';
var x = nome.length;
console.log(x);

resultado = x > 15 ? 'Obrigado' : 'Por favor, preencha seu nome completo'
console.log(resultado);

//UPPERCASE
var maiusculo = nome.toUpperCase();
console.log(maiusculo);

//INDEX OF
var jogo = 'Real vs Portugal melhor time';
var posicao = jogo.indexOf('Portugal');
console.log(posicao);

//SLICE
var cortado = jogo.slice(8, 16);
console.log(cortado);

//INCLUDES
var val = jogo.includes('Portugal');
console.log(val);

//CONCAT
var string1 = 'Hello';
var string2 = ' Chrystine';

var string3 = string1.concat(string2);
console.log(string3);

//TRIM
var frase = '   Olá, mundo!   ';
console.log(frase.trim());

//SPLIT
var num = '1|2|3|4|5|6|7|8';
var array = num.split('|');

console.log(array[1]);

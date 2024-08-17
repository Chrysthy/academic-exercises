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

//SUBSTRING
var linguagens = "JavaScript e Python"
var novaLinguagem = linguagens.substring(13, 19);
console.log(novaLinguagem);

//REPLACE
var frase2 = 'Hello world';
var frase3 = frase2.replace('world', 'Chrystine');

console.log(frase2);
console.log(frase3);


//O que o prof fez:
if (frase2.startsWith('Hello')) {
    let sub = frase2.substring(6);
    let novaFrase = sub.replace('world', 'Chrystine');
    let novaFraseMaiuscula = novaFrase.toUpperCase();

    console.log(novaFraseMaiuscula);

}


//MAIS STRINGS
var url = "http://minhaempresa.com.br/filme?nome=poder&atores=Lucas,Guilherme";

const parametros = url.split('?')[1];
const valores = parametros.split('&');

console.log(parametros);
console.log(valores);

for (let i = 0; 1 < valores.length; i++) {

    if (valores[i].startsWith('atores=')) {
        valores[i] = "atores=" + valores[i].substring(7).toUpperCase();
    }
}

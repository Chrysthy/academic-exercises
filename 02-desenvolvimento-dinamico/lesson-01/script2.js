let readlineSync = require('readline-sync');
let nome = readlineSync.question('Qual o seu nome?\n');
let idade = readlineSync.question('Qual a sua idade?\n');

console.log(`Olá, ${nome}.`);
console.log(`Sua idade é ${idade}.`);

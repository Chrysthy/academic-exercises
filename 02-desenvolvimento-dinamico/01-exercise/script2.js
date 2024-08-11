let readlineSync = require('readline-sync');
let nome = readlineSync.question('Qual o seu nome?\n');

console.log(`Olá, ${nome}.`);

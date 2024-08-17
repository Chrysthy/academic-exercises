//for in
let informacoes = {
    nome: "Chrystine",
    idade: 32,
    profissao: "Desenvolvedora"
}

for (let dados in informacoes) {
    console.log(`${dados}: ${informacoes[dados]}`);
}

//while
let numero = 0;

while (numero <= 10) {
    console.log(`O número é: ${numero}`);

    numero++;
}

//do while
let i = 6;

do {
    console.log('Teste: ' + i);

    i++;

} while (i <= 5)


//for of
let nome = 'Chrystine';

for (const caracteres of nome) {
    console.log(caracteres);

}
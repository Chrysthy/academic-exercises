const readline = require('readline-sync');

function calcularMediaPonderada(notas) {
    const pesos = [2, 3, 5];

    let somaPesos = 0;

    let somaNotas = 0;

    for (let i = 0; i < notas.length; i++) {

        somaPesos += pesos[i];
        somaNotas += notas[i] * pesos[i];
    }

    const media = somaNotas / somaPesos;

    return media;

};

function lerNotas() {
    const notas = [];

    for (let i = 0; i < 3; i++) {

        const nota = parseFloat(readline.question(`Digite a nota ${i + 1}: `));

        notas.push(nota);
    }

    return notas;

}

function main() {
    
    console.log("Calculadora de Média Ponderada\n");

    const notas = lerNotas();
    const media = calcularMediaPonderada(notas);

    console.log(`\nA média ponderada do aluno é ${media.toFixed(2)}`);

}

main()
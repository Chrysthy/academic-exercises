/*
Dado um array de números inteiros, o programa deve realizar duas verificações distintas. Na primeira verificação, é necessário identificar se pelo menos um número no array não é par ou é menor que zero. Para isso, deve-se percorrer o array e aplicar as seguintes condições a cada elemento: se o número não for par (ou seja, seu resto da divisão por 2 é diferente de zero) ou se for menor que zero, então a condição não é atendida. Caso ao menos uma dessas condições seja verdadeira para algum número do array, a resposta será ‘Sim’. Caso contrário, será ‘Não’.

Na segunda verificação, o programa deve determinar se todos os números no array são divisíveis por 3 e 5 simultaneamente. Novamente, é necessário percorrer o array e aplicar as seguintes condições a cada elemento: se o número não for divisível por 3 (ou seja, seu resto da divisão por 3 não é zero) ou se não for divisível por 5, então a condição não é atendida. Se todas as condições forem verdadeiras para todos os elementos do array, a resposta será ‘Sim’. Caso contrário, será ‘Não’.

Ao final das verificações, o programa exibirá os resultados no console. Essas verificações fornecem uma análise das propriedades do array, permitindo identificar se há números que não são pares ou menores que zero, assim como determinar se todos os números são divisíveis por 3 e 5 simultaneamente.

*/

let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

for (let i = 0; i < numeros.length; i++) {
    if (numeros[i] % 2 === 0 || numeros[i] < 0) {
        console.log('Não');

    } else {
        console.log('Sim');

    }

}

console.log(numeros);

let numeros2 = [3, 5, 7, 9, 11, 13, 15, 17, 19, 21];

for (let i = 0; i < numeros2.length; i++) {
    if (numeros2[i] % 3 === 0 && numeros2[i] % 5 === 0) {
        console.log('Sim');

    } else {
        console.log('Não');
    }
}

console.log(numeros2);


/*
// Array de números

const numeros = [5, 10, 15, 20, 25];

// Verificar se pelo menos um número do array não é par ou menor que 0

let algumNaoParOuMenorQueZero = false;

for (let i = 0; i < numeros.length; i++) {

if (numeros[i] % 2 !== 0 || numeros[i] < 0) {

algumNaoParOuMenorQueZero = true;

break;

}

}

// Verificar se todos os números do array são divisíveis por 3 e 5

let todosDivisiveisPor3E5 = true;

for (let i = 0; i < numeros.length; i++) {

if (numeros[i] % 3 !== 0 || numeros[i] % 5 !== 0) {

todosDivisiveisPor3E5 = false;

break;

}

}

console.log(“Pelo menos um número não é par ou menor que zero?”, algumNaoParOuMenorQueZero);

console.log(“Todos os números são divisíveis por 3 e 5?”, todosDivisiveisPor3E5);



*/
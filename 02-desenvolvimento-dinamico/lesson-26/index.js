//try, catch e finally
/*function divisao(a, b) {

    if (b === 0) {

        throw new Error('Divisão por zero não é permitida')
    }

    return a / b
}

try {

    const resultado = divisao(10, 0);
    console.log("Resultado" + resultado);


} catch (error) {

    console.log("Ocorreu uma execução: " + error.message);
    
}
*/

//Exemplo 2
/*const numeros = [1, 2, "3", 4, 5];

try {

    const doubleNumbers = numeros.map((num) => {

        if (typeof num !== 'number') {

            throw new Error('O array só pode ter números')
        }

        return num * 2;
    })

    console.log(doubleNumbers);


} catch (error) {

    console.log('Ocorreu uma exceção: ' + error.message);

}
*/

//Exemplo 3
function checkPositive(numeros) {

    if (!Array.isArray(numeros)) {

        throw new Error("O argumento deve ser um array")
    }

    const allPositive = numeros.every((num) => num > 0);

    if (!allPositive) {
        throw new Error("Todos os números devem ser positivos")
    }

    return true
}

try {

    const numbers = [1, 2, -3, 4, 5, 6]

    const isPositivo = checkPositive(numbers)

    console.log(isPositivo);


} catch (error) {
    console.log('Ocorreu um erro: ' + error.message);
}
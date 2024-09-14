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
const numeros = [1, 2, "3", 4, 5];

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


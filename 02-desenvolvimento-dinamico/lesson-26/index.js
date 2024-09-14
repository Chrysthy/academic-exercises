//try, catch e finally
function divisao(a, b) {

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
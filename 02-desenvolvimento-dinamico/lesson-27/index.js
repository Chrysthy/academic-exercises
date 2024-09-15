//Promise
//exemplo1
/*const minhaPromise = new Promise((resolve, reject) => {

    const sucesso = false

    if (sucesso) {

        resolve('Deu certo')

    } else {

        reject('Ocorreu um problema')
    }




})

minhaPromise
    .then((resultado) => {

        console.log('Foi sucesso: ' + resultado);

    })

    .catch((erro) => {

        console.log('Deu erro: ' + erro);
        
    })
*/

//Exemplo 2
/*function somarArray(array) {

    return new Promise((resolve, reject) => {

        if (!Array.isArray(array)) {

            reject('O argumento passado não é um array')
        }

        const soma = array.reduce((total, num) => total + num, 0)

        resolve(soma)

    })
}

const myArray = [1, 2, 3, 4, 5]
somarArray(myArray)
    .then((resultado) => {

        console.log('A soma dos elementos é: ', resultado);

    })

    .catch((erro) => {

        console.log('Ocorreu um erro: ' + erro);

    })
    
*/

//Exemplo 3
class MinhaClasse {

    constructor(valor) {

        this.valor = valor;

    }

    operacaoAssincrona() {

        return new Promise((resolve, reject) => {

            const resultado = this.valor * 2;

            if (resultado >= 10) {

                resolve(resultado)

            } else {

                reject("O resultado é negativo")
            }

        })

    }
}

const minhaClasse = new MinhaClasse(2)
minhaClasse.operacaoAssincrona()
    .then((resultado) => {

        console.log("O resultado é: " + resultado);

    })
    .catch((erro) => {

        console.log("Ocorreu um problema:", erro);

    })
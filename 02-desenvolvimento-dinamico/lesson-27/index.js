//Promise
const minhaPromise = new Promise((resolve, reject) => {

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
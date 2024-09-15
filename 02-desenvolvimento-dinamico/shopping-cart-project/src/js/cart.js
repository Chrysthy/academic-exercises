let carrinho = [];

function start() {

    fetch('https://fakestoreapi.com/products?limit=10')

        .then(response => response.json())

        .then(data => {
            preencherCarrinho(data)
        })

        .catch(error => {

            console.log('Ocorreu um erro', error);

        })

}

function preencherCarrinho(produtos) {
    
    produtos.forEach(data => {
        
    });
}
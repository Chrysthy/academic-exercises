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

        adicionarAoCarrinho(
            // tá vindo da api: title, image, etc
            data.title,
            data.image,
            data.description,
            data.price
        )
    });

    atualzarCarrinho();
}

function adicionarAoCarrinho(nome, imgLink, descricao, preco) {

    carrinho.push({

        "nome": nome,
        "imgLink": imgLink,
        "descricao": descricao,
        "preco": Number.parseFloat(preco),
        "quantidade": 0,
        "total": 0.0
    })
}
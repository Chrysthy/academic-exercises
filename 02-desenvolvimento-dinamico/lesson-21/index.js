function confirma() {

    let confirmacao = confirm("Você deseja excluir esse item?");

    if (confirmacao) {

        alert("Você irá excluir o item")

    } else {

        alert("Operação foi cancelada")
    }

}

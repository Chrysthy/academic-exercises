//Trabalhando com Eventos
function exemploEvento() {
    alert('mostrando o alert')
}

function passarMousePorCima() {
    document.getElementById('exemplo').innerHTML = 'Evento com o Mouse over'
};

function tirarMouse() {
    document.getElementById('exemplo').innerHTML = 'Evento com mouse out'
}

// function novoItem() {

//     var campoNome = document.getElementById("nome")
//     alert(`Seu nome é ${campoNome.value}`)
// }

function validarFormulario() {

    var nomePessoa = document.forms['formCadastro']['nome'].value;

    if (nomePessoa === '') {
        alert('Favor informar seu nome')
        event.preventDefault();

    } else {
        alert('Formulário válido')
    }
}
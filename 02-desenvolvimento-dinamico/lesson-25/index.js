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
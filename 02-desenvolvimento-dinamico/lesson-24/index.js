const elemento = document.createElement("div");

elemento.innerText = "Incluíndo texto na div com o JS";
elemento.style.backgroundColor = "lightgreen";

// append adicionar ao body
document.body.append(elemento)


var lista = document.getElementById("lista");
var li = document.createElement("li");

li.textContent = "Quem somos?";
lista.appendChild(li)
// appendChild é filha da lista



var times = ["Real Madrid", "Barcelona", "Juventus", "Vasco"];
var listaDeTimes = document.querySelector('ul#listatime');

for (var i = 0; i < times.length; i++) {

    var time = times[i];

    var listItem = document.createElement('li');
    listItem.innerText = time;
    listItem.style.border = '1px solid blue';

    listaDeTimes.appendChild(listItem);

}
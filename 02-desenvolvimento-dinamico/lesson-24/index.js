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
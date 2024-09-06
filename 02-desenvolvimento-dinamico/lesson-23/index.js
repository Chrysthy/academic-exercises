const listEstilo = document.querySelectorAll(".estilo");

for (let i = 0; i < listEstilo.length; i++) {

    listEstilo[i].style.backgroundColor = "blue";
    listEstilo[i].style.color = "white";
    listEstilo[i].innerText = listEstilo[i].innerText.toUpperCase();

}
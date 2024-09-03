elemento0 = document.getElementsByTagName('li')[0];
elemento0.style.color = 'blue';

elemento1 = document.getElementsByTagName('li')[1];
elemento1.style.background = 'red';

elemento2 = document.getElementsByTagName('li')[2];
elemento2.innerText = "SpringBoot";

elementoDiv = documento.getElmentById("conteudo");
elementoDiv.innerHTML = "<p> Estou colocando a Tag p dentro da div </p>";

elementoDivName = document.getElementsByName("divconteudo")[1];
elementoDivName.style.color = "blue";
elementoDivName.innerText = "Estou colocando um texto";

elementoDivClass = document.getElementsByClassName("mensagem")[2];
elementoDivClass.innerHTML = '<p> Mais um p dentro da div 2 </p>';

elementoSpanClass = document.querySelector("span.novo");
elementoSpanClass.style.color = 'yellow';

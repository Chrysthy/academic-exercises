//JSON
/*const pessoa = {

    nome: 'Chrystine',
    idade: 32,
    profissao: 'Desenvolvedora'
}

//passando para Json
const pessoaJson = JSON.stringify(pessoa);

console.log(pessoa);
console.log(pessoaJson);

//voltando para objeto
const pessoaObj = JSON.parse(pessoaJson)

console.log(pessoaObj);
*/

//Exemplo 2
fetch('https://jsonplaceholder.typicode.com/users')
    .then(response => response.json())
    .then(data => {

        preencherLista(data)
    })

function preencherLista(data) {

    const listaContainer = document.getElementById('lista-container');
    const ul = document.createElement('ul');

    data.array.forEach(item => {

        const li = document.createElement('li');
        li.textContent = item.name;
        ul.appendChild(li);
    });

    listaContainer.appendChild(ul)

}

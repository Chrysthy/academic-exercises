// window.alert("Nosso primeiro Alert");

// window.confirm("Deseja excluir esse item?");

// window.prompt("Qual é o seu nome?")


/*
Exercício 1
Crie um prompt informando "Digite seu nome:"

Guarde o nome digitado em uma variável só que em caixa alta.

Crie um outro prompt informando "Digite seu sobrenome:"

Guarde o sobrenome digitado em uma variável só que em caixa alta. 

Apresente o nome de sobrenome digitado em uma janela de alert.
*/

let nome = prompt("Digite seu nome?");
let sobrenome = prompt("Digite seu sobrenome?");

alert(`O seu nome completo é ${nome.toUpperCase()} ${sobrenome.toUpperCase()}.`)


/*
Exercício 2
Peça ao usuário para digitar um número. Guarde esse número em uma variável e peça ao usuário para digitar outro número.

Guarde esse número em outra variável. Agora, faça a soma dos números e apresente em um alert.

*/

let number1 = prompt("Digite um número.");
let number2 = prompt("Digite mais um número.");
let soma = number1 + number2;




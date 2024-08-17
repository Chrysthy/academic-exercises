/*
Você está trabalhando em um projeto de programação e precisa manipular um array que contém tanto strings quanto números. Para isso, você decide utilizar as funções ‘map’, ‘filter’ e ‘reduce’ em JavaScript.

O array dado possui uma combinação de strings e números, e sua tarefa é realizar algumas operações específicas nele. Primeiramente, utilizando a função ‘map’, você deve criar um novo array onde os números serão duplicados e as strings serão transformadas em letras maiúsculas. Caso existam elementos de outros tipos no array, eles devem ser mantidos sem alteração.

Em seguida, utilizando a função ‘filter’, você deve criar outro array contendo somente os números presentes no array original. Ou seja, todos os elementos que não são números devem ser excluídos.

Por fim, utilizando a função ‘reduce’, você deve somar todos os números do array original. O resultado dessa soma deve ser armazenado em uma variável.

Essas operações permitem que você manipule e transforme os elementos do array de acordo com suas necessidades específicas. Ao final do processo, você terá um novo array com elementos modificados, um array contendo apenas os números e a soma de todos eles.

Lembre-se de utilizar corretamente as funções ‘map’, ‘filter’ e ‘reduce’ em JavaScript para resolver esse problema.
*/

let diversos = [1, 'quatro', 8, 'doze', 22, 'treze', true, 100];

let map = diversos.map((elementos) => {
    if (typeof elementos === 'number') {
        return elementos * 2;

    } else if (typeof elementos === 'string') {
        return elementos.toUpperCase();

    } else {
        return elementos;
    }
})

console.log(map);


let filter = diversos.filter((numeros) => {
    return typeof numeros === 'number';
})

console.log(filter);


let reduce = diversos.reduce(function (acumlador, elemento) {

    if (typeof elemento === 'number') {
        return acumlador + elemento;

    } else {
        return acumlador;
    }

}, 0)

console.log(reduce);


/*
**Resolução**

const array = [1, ‘dois’, 3, ‘quatro’, 5, ‘seis’];

// Utilizando map para duplicar os números e transformar as strings em letras maiúsculas

const mappedArray = array.map((element) => {

if (typeof element === ‘number’) {

return element * 2;

} else if (typeof element === ‘string’) {

return element.toUpperCase();

} else {

return element;

}

});

console.log(‘Array mapeado:’, mappedArray);

// Utilizando filter para filtrar somente os números do array

const filteredArray = array.filter((element) => typeof element === ‘number’);

console.log(‘Array filtrado:’, filteredArray);

// Utilizando reduce para somar os números do array

const sum = array.reduce((accumulator, element) => {

if (typeof element === ‘number’) {

return accumulator + element;

} else {

return accumulator;

}

}, 0);

console.log(‘Soma:’, sum);
*/
// Entre no terminal: dart aula_02_03.dart

// Listas
// 1.	Criando e Usando Listas
// Função principal onde o programa começa a ser executado
void main() {
  // Cria uma lista chamada 'fruits' que armazena strings (nomes de frutas)
  List<String> fruits = ['Apple', 'Banana', 'Orange'];

  // Acessa e exibe o primeiro elemento da lista, que é 'Apple'
  // O índice 0 representa o primeiro item da lista
  print(fruits[0]);

  // Adiciona a fruta 'Grape' à lista usando o método 'add'
  fruits.add('Grape');

  // Exibe a lista completa após a adição do novo item
  print(fruits);
}

/*******************
// Conjuntos
// 1.	Criando e Usando Conjuntos
// Função principal onde o programa começa a ser executado
void main() {
  // Cria um conjunto (Set) chamado 'numbers' que armazena números inteiros
  Set<int> numbers = {1, 2, 3, 4};

  // Tenta adicionar o número 4 ao conjunto
  // Como um Set não permite duplicatas, o número 4 não será adicionado novamente
  numbers.add(4);

  // Exibe o conteúdo do conjunto 'numbers'
  print(numbers);  // A saída será {1, 2, 3, 4}
}
*/

/*******************
// Mapas
// 1.	Criando e Usando Mapas
// Função principal onde o programa começa a ser executado
void main() {
  // Cria um Map chamado 'capitals' que mapeia (associa) países a suas capitais
  // O Map armazena pares chave-valor, onde as chaves e os valores são strings
  Map<String, String> capitals = {
    'USA': 'Washington, D.C.',  // Chave: 'USA', Valor: 'Washington, D.C.'
    'France': 'Paris',          // Chave: 'France', Valor: 'Paris'
    'Japan': 'Tokyo'            // Chave: 'Japan', Valor: 'Tokyo'
  };

  // Acessa e exibe o valor associado à chave 'France' no Map
  // O valor exibido será 'Paris'
  print(capitals['France']);

  // Adiciona um novo par chave-valor ao Map
  // Chave: 'Germany', Valor: 'Berlin'
  capitals['Germany'] = 'Berlin';

  // Exibe o conteúdo atualizado do Map, incluindo o novo par 'Germany': 'Berlin'
  print(capitals);
}
*/


/*******************
// Operações Comuns
// 1.	Iteração em Coleções
// Função principal onde o programa começa a ser executado
void main() {
  // Cria uma lista de strings chamada 'fruits' com três frutas: 'Apple', 'Banana', 'Orange'
  List<String> fruits = ['Apple', 'Banana', 'Orange'];

  // Um loop 'for' que percorre cada elemento (fruta) da lista 'fruits'
  // Para cada elemento, a variável 'fruit' será atribuída ao item atual da lista
  for (var fruit in fruits) {
    // Exibe o valor atual de 'fruit' no console
    print(fruit);  // A saída será: 'Apple', 'Banana', 'Orange'
  }
}
*/


/*******************
// 2.	Manipulação de Elementos
// Função principal onde o programa começa a ser executado
void main() {
  // Cria uma lista de números inteiros chamada 'numbers'
  List<int> numbers = [1, 2, 3, 4, 5];

  // Remove o elemento no índice 2 da lista
  // Índices começam em 0, então o terceiro elemento (índice 2) é o número 3
  numbers.removeAt(2);

  // Exibe a lista atualizada após a remoção
  print(numbers);  // A saída será: [1, 2, 4, 5]
}
*/

// Entre no terminal: dart aula_02_02.dart

// Declarando e Chamando Funções
// 1.	Função Simples

// Função que exibe 'Hello!' no console
void sayHello() {
  // O comando print exibe a mensagem 'Hello!' no console
  print('Hello!');
}

// Função principal, onde o programa começa a ser executado
void main() {
  // Chama (executa) a função 'sayHello', que exibe a mensagem 'Hello!' no console
  sayHello();
}

/****************
// 2.	Função com Parâmetros
// Função que recebe um nome como argumento e exibe uma saudação no console
void greet(String name) {
  // O comando print exibe 'Hello, [nome]!' no console, usando a variável 'name'
  print('Hello, $name!');
}

// Função principal, onde o programa começa a ser executado
void main() {
  // Chama a função 'greet' e passa 'Alice' como argumento
  // Isso fará com que a função exiba 'Hello, Alice!' no console
  greet('Alice');
}
*/

/****************
// Retornando Valores de Funções
// 1.	Função com Retorno
// Função que recebe dois números inteiros 'a' e 'b' e retorna a soma deles
int add(int a, int b) {
  // O comando return devolve a soma de 'a' e 'b' como resultado
  return a + b;
}

// Função principal, onde o programa começa a ser executado
void main() {
  // Chama a função 'add' passando os números 3 e 5 como argumentos
  // O resultado da soma será armazenado na variável 'result'
  int result = add(3, 5);

  // Exibe o resultado da soma no console
  print('Result: $result'); // A saída será: 'Result: 8'
}
*/

/****************
// Funções Anônimas e Arrow Functions
// 1.	Função Anônima
// Função principal onde o programa começa a ser executado
void main() {
  // Declaração de uma lista de frutas usando a palavra-chave 'var'
  // A lista contém três itens: 'apples', 'bananas', e 'oranges'
  var list = ['apples', 'bananas', 'oranges'];

  // O método 'forEach' percorre cada item da lista
  // Para cada item, ele executa o bloco de código que está dentro das chaves {}
  list.forEach((item) {
    // Para cada item da lista, o comando print exibe 'Item: [item]'
    // Exemplo de saída: 'Item: apples', 'Item: bananas', 'Item: oranges'
    print('Item: $item');
  });
}
*/

/****************
// 2.	Arrow Function
// Função que recebe dois números inteiros 'a' e 'b' e retorna o produto deles
int multiply(int a, int b) => a * b; 
// O '=>' é uma forma curta de escrever funções que retornam um valor.
// Neste caso, ele está retornando o resultado da multiplicação de 'a' por 'b'.

// Função principal onde o programa começa a ser executado
void main() {
  // Chama a função 'multiply' passando 4 e 5 como argumentos
  // O resultado da multiplicação (20) será exibido no console
  print('Multiply: ${multiply(4, 5)}');
  // O uso de '${multiply(4, 5)}' permite inserir o resultado da função dentro da string.
  // A saída será: 'Multiply: 20'
}
*/

/****************
// Métodos das Classes
// 1.	Métodos de Instância
// Definindo uma classe chamada 'Person'
class Person {
  // A classe tem dois atributos: 'name' (nome) e 'age' (idade)
  String name; // Armazena o nome da pessoa
  int age; // Armazena a idade da pessoa

  // Construtor da classe 'Person'
  // Ele recebe dois parâmetros: o nome e a idade, e inicializa os atributos da classe
  Person(this.name, this.age);

  // Método da classe que exibe uma mensagem de apresentação no console
  void introduce() {
    // O método 'introduce' exibe o nome e a idade da pessoa
    print('Hello, my name is $name and I am $age years old.');
    // O uso de '$name' e '$age' permite que o valor das variáveis 'name' e 'age'
    // seja inserido na string
  }
}

void main() {
  // Criando uma instância da classe 'Person' chamada 'person'
  // Estamos passando 'John' como o nome e 25 como a idade
  var person = Person('John', 25);

  // Chamando o método 'introduce' da instância 'person'
  // Isso vai exibir: 'Hello, my name is John and I am 25 years old.'
  person.introduce();
}
*/
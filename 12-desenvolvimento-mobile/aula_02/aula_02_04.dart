// Entre no terminal: dart aula_02_05.dart

// Programação OO com Dart
// Classes e Objetos
// 1.	Definindo Classes e Criando Objetos
// Definindo uma classe chamada 'Car'
class Car {
  // Atributos da classe 'Car': 'model' (modelo) e 'year' (ano)
  String model;  // Armazena o modelo do carro
  int year;      // Armazena o ano do carro

  // Construtor da classe 'Car'
  // Ele recebe dois parâmetros: o modelo e o ano, e inicializa os atributos da classe
  Car(this.model, this.year);

  // Método da classe que exibe as informações do carro no console
  void displayInfo() {
    // O método 'displayInfo' exibe o modelo e o ano do carro
    print('Model: $model, Year: $year');
    // O uso de '$model' e '$year' permite que o valor das variáveis 'model' e 'year'
    // seja inserido na string
  }
}

void main() {
  // Criando uma instância da classe 'Car' chamada 'car'
  // Estamos passando 'Toyota' como o modelo e 2020 como o ano
  var car = Car('Toyota', 2020);

  // Chamando o método 'displayInfo' da instância 'car'
  // Isso vai exibir: 'Model: Toyota, Year: 2020'
  car.displayInfo();
}

/*************************
// Herança
// 1.	Implementando Herança
// Definindo uma classe chamada 'Animal'
class Animal {
  // Método da classe 'Animal' que exibe uma mensagem 'Eating...' (Comendo)
  void eat() {
    print('Eating...'); // Exibe a mensagem 'Eating...' no console
  }
}

// Definindo uma classe chamada 'Dog' que herda (extends) a classe 'Animal'
class Dog extends Animal {
  // Método específico da classe 'Dog' que exibe uma mensagem 'Barking...' (Latindo)
  void bark() {
    print('Barking...'); // Exibe a mensagem 'Barking...' no console
  }
}

void main() {
  // Criando uma instância da classe 'Dog' chamada 'dog'
  var dog = Dog();

  // A classe 'Dog' herda o método 'eat()' da classe 'Animal', então podemos chamar 'eat'
  dog.eat(); // Isso vai exibir: 'Eating...'

  // Chamando o método 'bark()' da classe 'Dog'
  dog.bark(); // Isso vai exibir: 'Barking...'
}
*/


/*************************
// Interfaces e Mixins
// 1.	Implementando Interfaces
// Definindo uma classe abstrata chamada 'Shape'
abstract class Shape {
  // Método abstrato 'draw' que precisa ser implementado pelas classes que implementam 'Shape'
  void draw();  // Não há implementação aqui; as classes concretas irão fornecer a implementação
}

// Definindo uma classe chamada 'Circle' que implementa a interface 'Shape'
class Circle implements Shape {
  // Implementando o método 'draw' da interface 'Shape'
  @override
  void draw() {
    print('Drawing a circle');  // Exibe a mensagem 'Drawing a circle' no console
  }
}

void main() {
  // Criando uma instância da classe 'Circle'
  var circle = Circle();

  // Chamando o método 'draw' da instância 'circle', que exibe 'Drawing a circle'
  circle.draw();
}
*/


/*************************
// 2.	Usando Mixins
// Definindo um mixin chamado 'CanFly'
mixin CanFly {
  // O método 'fly' exibe a mensagem 'Flying...' (Voando) no console
  void fly() {
    print('Flying...');
  }
}

// Definindo uma classe chamada 'Bird' que usa (with) o mixin 'CanFly'
class Bird with CanFly {
  // A classe 'Bird' agora tem acesso ao método 'fly' do mixin 'CanFly'
}

void main() {
  // Criando uma instância da classe 'Bird'
  var bird = Bird();

  // Chamando o método 'fly', que foi adicionado à classe 'Bird' pelo mixin 'CanFly'
  bird.fly();  // Isso vai exibir: 'Flying...'
}
*/


/*************************
// Construtores
// 1.	Construtores Nomeados
// Definindo uma classe chamada 'Person'
class Person {
  // Atributos da classe 'Person': 'name' (nome) e 'age' (idade)
  String name;  // Armazena o nome da pessoa
  int age;      // Armazena a idade da pessoa

  // Construtor principal da classe 'Person'
  // Ele recebe dois parâmetros: o nome e a idade, e inicializa os atributos
  Person(this.name, this.age);

  // Construtor nomeado 'named'
  // Ele recebe apenas o nome, define a idade como 0 por padrão
  Person.named(String name) {
    this.name = name;
    this.age = 0;  // Idade padrão é 0
  }
}

void main() {
  // Criando uma instância da classe 'Person' chamada 'person1' usando o construtor padrão
  var person1 = Person('Alice', 30);

  // Criando uma instância da classe 'Person' chamada 'person2' usando o construtor nomeado
  var person2 = Person.named('Bob');

  // Exibindo as informações das pessoas no console
  // Para 'person1', será exibido: 'Person1: Alice, 30'
  // Para 'person2', será exibido: 'Person2: Bob, 0'
  print('Person1: ${person1.name}, ${person1.age}');
  print('Person2: ${person2.name}, ${person2.age}');
}
*/

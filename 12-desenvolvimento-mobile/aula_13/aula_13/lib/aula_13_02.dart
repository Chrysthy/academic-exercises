// Padrões Criacionais
//  Singleton
//    O padrão Singleton garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global a essa instância.
//    1.	Implementação do Singleton em Flutter

// Esta implementação garante que apenas uma instância da classe Singleton será criada e pode ser acessada globalmente através de Singleton.instance.
import 'package:flutter/foundation.dart';

class Singleton {
  // Construtor privado
  Singleton._privateConstructor();

  // Instância única da classe
  static final Singleton instance = Singleton._privateConstructor();

  // Método exemplo
  void doSomething() {
    if (kDebugMode) {
      if (kDebugMode) {
        print('Fazendo algo...');
      }
    }
  }
}

void main() {
  // Acessando a instância única
  Singleton singleton = Singleton.instance;
  singleton.doSomething();
}

/*
// Factory Method
//  O padrão Factory Method define uma interface para criar um objeto, mas permite que as subclasses alterem o tipo de objetos que serão criados.
//  1.	Implementação do Factory Method em Flutter

// O Factory Method permite que subclasses definam qual classe será instanciada, mantendo a criação de objetos encapsulada.

abstract class Product {
  void operation();
}

class ConcreteProductA implements Product {
  @override
  void operation() {
    print('Operação do Produto A');
  }
}

class ConcreteProductB implements Product {
  @override
  void operation() {
    print('Operação do Produto B');
  }
}

abstract class Creator {
  Product factoryMethod();
}

class ConcreteCreatorA extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProductA();
  }
}

class ConcreteCreatorB extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProductB();
  }
}

void main() {
  Creator creator = ConcreteCreatorA();
  Product product = creator.factoryMethod();
  product.operation();

  creator = ConcreteCreatorB();
  product = creator.factoryMethod();
  product.operation();
}

// Builder
//  O padrão Builder separa a construção de um objeto complexo da sua representação, permitindo que o mesmo processo de construção crie diferentes representações.
//  1.	Implementação do Builder em Flutter

// O padrão Builder permite a criação de objetos complexos passo a passo, com um processo de construção flexível.
class Product {
  String partA;
  String partB;

  Product({required this.partA, required this.partB});
}

class Builder {
  String? _partA;
  String? _partB;

  Builder setPartA(String partA) {
    _partA = partA;
    return this;
  }

  Builder setPartB(String partB) {
    _partB = partB;
    return this;
  }

  Product build() {
    return Product(partA: _partA!, partB: _partB!);
  }
}

void main() {
  Builder builder = Builder();
  Product product = builder.setPartA('Parte A').setPartB('Parte B').build();
  print('Produto criado com: ${product.partA} e ${product.partB}');
}
*/
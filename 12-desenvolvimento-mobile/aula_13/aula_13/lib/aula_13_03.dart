// Padrões Estruturais
//  Adapter
//    O padrão Adapter permite que classes com interfaces incompatíveis trabalhem juntas, convertendo a interface de uma classe em outra interface esperada pelos clientes.
//    1.	Implementação do Adapter em Flutter

// O Adapter converte a interface de Adaptee em uma interface compatível com Target.
import 'package:flutter/foundation.dart';

class Target {
  void request() {
    if (kDebugMode) {
      print('Requisição padrão');
    }
  }
}

class Adaptee {
  void specificRequest() {
    if (kDebugMode) {
      print('Requisição específica');
    }
  }
}

class Adapter extends Target {
  final Adaptee adaptee;

  Adapter(this.adaptee);

  @override
  void request() {
    adaptee.specificRequest();
  }
}

void main() {
  Adaptee adaptee = Adaptee();
  Target target = Adapter(adaptee);
  target.request();
}

/*
//  Composite
//    O padrão Composite permite que objetos individuais e composições de objetos sejam tratados de maneira uniforme.
//    1.	Implementação do Composite em Flutter

// O Composite permite que Leaf e Composite sejam tratados de maneira uniforme através da interface Component.
abstract class Component {
  void operation();
}

class Leaf extends Component {
  @override
  void operation() {
    print('Operação da Folha');
  }
}

class Composite extends Component {
  List<Component> _children = [];

  void add(Component component) {
    _children.add(component);
  }

  void remove(Component component) {
    _children.remove(component);
  }

  @override
  void operation() {
    for (var child in _children) {
      child.operation();
    }
  }
}

void main() {
  Leaf leaf1 = Leaf();
  Leaf leaf2 = Leaf();
  Composite composite = Composite();

  composite.add(leaf1);
  composite.add(leaf2);

  composite.operation();
}

//   Decorator
//      O padrão Decorator permite adicionar comportamento a objetos individualmente, sem afetar o comportamento de outros objetos da mesma classe.
//      1.	Implementação do Decorator em Flutter

// O Decorator permite adicionar comportamento adicional a ConcreteComponent sem alterar sua estrutura original.
abstract class Component {
  String operation();
}

class ConcreteComponent implements Component {
  @override
  String operation() {
    return 'Componente Concreto';
  }
}

class Decorator implements Component {
  final Component _component;

  Decorator(this._component);

  @override
  String operation() {
    return _component.operation();
  }
}

class ConcreteDecorator extends Decorator {
  ConcreteDecorator(Component component) : super(component);

  @override
  String operation() {
    return 'Decorator + ' + super.operation();
  }
}

void main() {
  Component component = ConcreteComponent();
  Component decorated = ConcreteDecorator(component);

  print(decorated.operation());
}
*/
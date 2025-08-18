// Padrões Comportamentais
//  Observer
//    O padrão Observer define uma dependência um-para-muitos entre objetos, de modo que quando um objeto muda de estado, todos os seus dependentes são notificados e atualizados automaticamente.
//    1.	Implementação do Observer em Flutter

// O padrão Observer permite que a UI reaja automaticamente às mudanças de estado do Subject.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Subject que notifica seus observadores quando o estado muda
class Subject extends ChangeNotifier {
  String _state = 'Estado inicial';

  String get state => _state;

  void setState(String state) {
    _state = state;
    notifyListeners(); // Notifica todos os listeners (observadores)
  }
}

// Widget Observer que observa mudanças no Subject
class Observer extends StatelessWidget {
  final Subject subject;

  const Observer(this.subject, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Subject>.value(
      value: subject,
      child: Consumer<Subject>(
        builder: (context, subject, child) {
          return Center(
            child: Text(
              subject.state,
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}

/*
//  Strategy
//    O padrão Strategy define uma família de algoritmos, encapsula cada um deles e os torna intercambiáveis. O Strategy permite que o algoritmo varie independentemente dos clientes que o utilizam.
//    1.	Implementação do Strategy em Flutter

// O padrão Strategy permite alterar o algoritmo usado pelo Context sem modificar o código do Context.

import 'package:flutter/foundation.dart';

class Context {
  Strategy _strategy;

  Context(this._strategy);

  void setStrategy(Strategy strategy) {
    _strategy = strategy;
  }

  void executeStrategy() {
    _strategy.algorithm();
  }
}

abstract class Strategy {
  void algorithm();
}

class ConcreteStrategyA implements Strategy {
  @override
  void algorithm() {
    if (kDebugMode) {
      print('Algoritmo A');
    }
  }
}

class ConcreteStrategyB implements Strategy {
  @override
  void algorithm() {
    if (kDebugMode) {
      print('Algoritmo B');
    }
  }
}

void main() {
  Context context = Context(ConcreteStrategyA());
  context.executeStrategy();

  context.setStrategy(ConcreteStrategyB());
  context.executeStrategy();
}

//  Command
//    O padrão Command encapsula uma solicitação como um objeto, permitindo que você parametrize clientes com diferentes solicitações, enfileire ou registre solicitações e suporte operações que podem ser desfeitas.
//    1.	Implementação do Command em Flutter

// O padrão Command encapsula solicitações como objetos, permitindo que sejam manipuladas de forma flexível e independente.

import 'package:flutter/foundation.dart';

class Command {
  void execute() {}
}

class ConcreteCommandA implements Command {
  final Receiver _receiver;

  ConcreteCommandA(this._receiver);

  @override
  void execute() {
    _receiver.actionA();
  }
}

class ConcreteCommandB implements Command {
  final Receiver _receiver;

  ConcreteCommandB(this._receiver);

  @override
  void execute() {
    _receiver.actionB();
  }
}

class Receiver {
  void actionA() {
    if (kDebugMode) {
      print('Ação A');
    }
  }

  void actionB() {
    if (kDebugMode) {
      print('Ação B');
    }
  }
}

class Invoker {
  final List<Command> _commands = [];

  void setCommand(Command command) {
    _commands.add(command);
  }

  void executeCommands() {
    for (var command in _commands) {
      command.execute();
    }
  }
}

void main() {
  Receiver receiver = Receiver();
  Command commandA = ConcreteCommandA(receiver);
  Command commandB = ConcreteCommandB(receiver);

  Invoker invoker = Invoker();
  invoker.setCommand(commandA);
  invoker.setCommand(commandB);

  invoker.executeCommands();
}
*/

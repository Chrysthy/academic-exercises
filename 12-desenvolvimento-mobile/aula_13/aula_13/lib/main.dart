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
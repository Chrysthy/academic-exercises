// Widgets Interativos
//    Os widgets interativos são aqueles que respondem quando você faz algo, como clicar, tocar ou arrastar. 
//    Eles são os elementos no aplicativo que você pode mexer para que algo aconteça.

// Detecção de Gestos
//    Detecção de gestos significa que o aplicativo pode perceber e reagir aos movimentos 
//    que você faz com seus dedos na tela.

// Interação Básica do Usuário
//  Widgets Interativos
//    1.	Widget RaisedButton
//    2.	Widget TextField
//      Detecção de Gestos
//    1.	Widget GestureDetector
//  Exemplo de Interação Completa
//    1.	Código Completo

import 'package:flutter/material.dart'; // Importa a biblioteca de componentes do Flutter

// A função main é o ponto de entrada do aplicativo
void main() {
  runApp(const MyApp()); // Executa o widget principal da aplicação, que é o MyApp
}

// O MyApp é o widget principal do aplicativo
// StatelessWidget significa que o widget não muda de estado durante a execução
class MyApp extends StatelessWidget {
  // Construtor da classe MyApp com o parâmetro 'key', usado para identificar o widget
  const MyApp({super.key});

  // O método build é responsável por construir a interface visual do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp é um contêiner básico para aplicativos que seguem o padrão Material Design
      home: Scaffold(
        // Scaffold define a estrutura básica da tela, com AppBar (barra superior) e corpo (body)
        appBar: AppBar(
          // AppBar é a barra superior onde normalmente colocamos o título da tela
          title: const Text('Interação Básica do Usuário'), // Texto exibido na barra superior
        ),
        // O corpo da tela é o widget InteractionExample
        body: const InteractionExample(), // Chamamos o widget que contém a interação com o botão
      ),
    );
  }
}

// InteractionExample é um StatefulWidget, o que significa que ele pode mudar de estado (dinamicamente)
class InteractionExample extends StatefulWidget {
  // Construtor padrão da classe InteractionExample
  const InteractionExample({super.key});

  // O método createState retorna a classe de estado InteractionExampleState
  @override
  InteractionExampleState createState() => InteractionExampleState();
}

// InteractionExampleState é a classe que gerencia o estado do InteractionExample
class InteractionExampleState extends State<InteractionExample> {
  // Variável de estado que armazena o texto exibido na tela
  String _displayText = 'Pressione o botão'; // Texto inicial exibido

  // Função chamada quando o botão é pressionado para atualizar o texto
  void _updateText() {
    setState(() {
      // Quando setState é chamado, o Flutter atualiza a tela com o novo valor de _displayText
      _displayText = 'Botão pressionado!'; // Atualiza o texto ao pressionar o botão
    });
  }

  // O método build constrói a interface visual para o InteractionExampleState
  @override
  Widget build(BuildContext context) {
    return Center(
      // Center centraliza o conteúdo no meio da tela
      child: Column(
        // Column organiza widgets verticalmente (um embaixo do outro)
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets na tela
        children: <Widget>[
          // O primeiro widget é um Text que exibe o valor de _displayText
          Text(
            _displayText, // O texto exibido é o valor da variável _displayText
            style: const TextStyle(fontSize: 20), // Define o tamanho da fonte do texto
          ),
          const SizedBox(height: 20), // Adiciona um espaço de 20 pixels entre o texto e o botão
          // ElevatedButton é o botão que, quando pressionado, executa a função _updateText
          ElevatedButton(
            onPressed: _updateText, // Define a ação a ser executada quando o botão é pressionado
            child: const Text('Pressione-me'), // O texto exibido dentro do botão
          ),
        ],
      ),
    );
  }
}
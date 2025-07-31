// Imagine que você está construindo um quebra-cabeça, e cada peça é parte importante para formar a imagem completa. 
// No Flutter, essas "peças" são chamadas de widgets, e eles são usados para construir a tela de um aplicativo.

// O que são widgets?
//  Um widget é como um bloco de construção do aplicativo. 
//  Tudo o que você vê e interage na tela, como um botão, um texto, uma imagem ou até a forma como as coisas estão organizadas, é um widget.

// Exemplos fáceis de entender:
//  Texto: O título ou qualquer palavra que aparece na tela é um widget.
//  Botão: O botão que você clica para abrir uma nova tela ou enviar uma mensagem é outro exemplo de widget.
//  Imagem: Uma foto ou um ícone exibido no aplicativo também é um widget.

// Como eles funcionam juntos?
//  Assim como você monta várias peças de quebra-cabeça para formar uma imagem, no Flutter, você junta widgets para construir a tela do seu aplicativo. 
//  Você pode colocar widgets em fila (um ao lado do outro) ou empilhá-los um sobre o outro.

// Widgets e Layouts Básicos
//  Widgets Básicos
//    1.	Widget Text
//    2.	Widget Image
//  Layouts Básicos
//    1.	Widget Column
//    2.	Widget Row
//  Containers
//    1.	Widget Container
//        O Container no Flutter é como uma caixa onde você pode colocar outras coisas dentro, 
//        como textos, imagens ou até outros widgets. Essa caixa também pode ser personalizada de várias maneiras.

import 'package:flutter/material.dart'; // Importa a biblioteca básica de widgets do Flutter

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp()); // Executa o aplicativo que estamos criando, chamado MyApp
}

// Define a classe do aplicativo principal, que herda de StatelessWidget (um widget que não muda)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // O método build é onde criamos a interface visual do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp é o contêiner principal que configura o tema e navegação do app
      home: Scaffold(
        appBar: AppBar(
          // Barra superior com o título do app
          title: const Text('Widgets e Layouts Básicos'),
        ),
        // O corpo da tela centraliza todos os widgets usando Center
        body: Center(
          // Column organiza os widgets verticalmente (um abaixo do outro)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Primeiro widget: Texto estilizado
              const Text(
                'Olá, Flutter!',
                style: TextStyle(
                  fontSize: 24, // Tamanho da fonte
                  fontWeight: FontWeight.bold, // Texto em negrito
                ),
              ),

              // Segundo widget: Imagem carregada da internet
              Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
              ),

              // Terceiro widget: Coluna com dois textos
              const Column(
                children: <Widget>[
                  Text('Texto 1'),
                  Text('Texto 2'),
                ],
              ),

              // Quarto widget: Linha com dois textos
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaçamento uniforme
                children: <Widget>[
                  Text('Texto 1'),
                  Text('Texto 2'),
                ],
              ),

              // Quinto widget: Container com texto e fundo azul
              Container(
                padding: const EdgeInsets.all(16.0), // Espaçamento interno
                decoration: BoxDecoration(
                  color: Colors.blue, // Fundo azul
                  borderRadius: BorderRadius.circular(8.0), // Cantos arredondados
                ),
                child: const Text(
                  'Conteúdo do Container',
                  style: TextStyle(color: Colors.white), // Texto branco
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
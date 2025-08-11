// Widgets Básicos
//  1.	Text Widget
//    O Text widget é usado para exibir texto na tela.
//  2.	Container Widget
//    O Container é um widget flexível usado para criar caixas com propriedades específicas, como margens, padding e alinhamento.
//  3.	Row e Column Widgets
//    Row e Column são usados para organizar widgets em linhas e colunas, respectivamente.
//  4.	Scaffold Widget
//    O Scaffold é um widget que fornece uma estrutura básica de layout para um aplicativo.

import 'package:flutter/material.dart';

// Função principal onde o programa começa a ser executado
void main() {
  runApp(const MyApp());  // Executa o aplicativo MyApp
}

// Classe principal do aplicativo, que usa StatelessWidget (o estado não muda)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O MaterialApp é o contêiner principal do aplicativo, que define o tema e a navegação
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets Básicos'),
        ),
        body: SingleChildScrollView(  // Adiciona rolagem se o conteúdo for maior que a tela
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // --- 1. Text Widget ---
              // O Text widget é usado para exibir texto simples na tela
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de Text Widget:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Exibindo o texto "Olá, Mundo!"
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Olá, Mundo!'),
              ),
              const Divider(),  // Linha divisória para separar os exemplos

              // --- 2. Container Widget ---
              // O Container é um widget flexível que pode conter outros widgets e aplicar estilos
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de Container Widget:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // O Container envolve o Text e adiciona padding e cor de fundo
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: const Text(
                  'Texto dentro de um Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Divider(),  // Linha divisória para separar os exemplos

              // --- 3. Row e Column Widgets ---
              // Row organiza widgets horizontalmente e Column organiza widgets verticalmente
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de Row e Column Widgets:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Linha 1, '),
                      Text('Item 1'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Linha 2, '),
                      Text('Item 2'),
                    ],
                  ),
                ],
              ),
              const Divider(),  // Linha divisória para separar os exemplos

              // --- 4. Scaffold Widget ---
              // O Scaffold é a estrutura básica de layout que fornece AppBar, body e mais
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de Scaffold Widget:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // O corpo do Scaffold com um FloatingActionButton no exemplo
              const Text('Este aplicativo usa um Scaffold com AppBar e FloatingActionButton'),
            ],
          ),
        ),
        // O FloatingActionButton aparece flutuando no canto inferior direito
        floatingActionButton: FloatingActionButton(
          onPressed: () {},  // Não faz nada ao ser pressionado
          child: const Icon(Icons.add),  // Ícone de adicionar
        ),
      ),
    );
  }
}

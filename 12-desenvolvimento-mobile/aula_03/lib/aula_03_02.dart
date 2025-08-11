// Widgets de Animação Básicos
//  1.	AnimatedContainer
//    O AnimatedContainer permite animar mudanças em suas propriedades, como tamanho, cor e borda.
//  2.	AnimatedOpacity
//    O AnimatedOpacity permite animar mudanças na opacidade de um widget.

import 'package:flutter/material.dart';

// Função principal onde o programa começa a ser executado
void main() {
  runApp(const MyApp());  // Executa o aplicativo MyApp
}

// O StatefulWidget é usado porque vamos mudar o estado dos widgets
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

// Classe de estado onde as animações e a lógica serão controladas
class _MyAppState extends State<MyApp> {
  // Variável usada para controlar o estado do AnimatedContainer
  bool _isExpanded = false;

  // Variável usada para controlar a visibilidade no AnimatedOpacity
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // Retorna o MaterialApp que contém os dois exemplos de animação
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets de Animação Básicos'),
        ),
        // O SingleChildScrollView permite rolar a tela se houver muito conteúdo
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // --- 1. AnimatedContainer ---
              // Este é o primeiro exemplo, o AnimatedContainer
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de AnimatedContainer:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                // O GestureDetector detecta toques na tela e ativa a animação
                onTap: () {
                  setState(() {
                    // Alterna o estado de _isExpanded para expandir ou reduzir o container
                    _isExpanded = !_isExpanded;
                  });
                },
                child: AnimatedContainer(
                  // Muda a largura e a altura conforme o estado de _isExpanded
                  width: _isExpanded ? 200.0 : 100.0,
                  height: _isExpanded ? 200.0 : 100.0,
                  // Altera a cor conforme o estado de _isExpanded
                  color: _isExpanded ? Colors.blue : Colors.red,
                  // Alinha o conteúdo dependendo do estado
                  alignment: _isExpanded ? Alignment.center : AlignmentDirectional.topCenter,
                  // Define a duração da animação como 1 segundo
                  duration: const Duration(seconds: 1),
                  // O texto dentro do AnimatedContainer
                  child: const Text('Toque Aqui', style: TextStyle(color: Colors.white)),
                ),
              ),
              const Divider(),  // Linha divisória para separar os exemplos

              // --- 2. AnimatedOpacity ---
              // Este é o segundo exemplo, o AnimatedOpacity
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Exemplo de AnimatedOpacity:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Exemplo de animação de opacidade
              AnimatedOpacity(
                // A opacidade muda de 1.0 (visível) para 0.0 (invisível) e vice-versa
                opacity: _visible ? 1.0 : 0.0,
                // Define a duração da transição de opacidade como 1 segundo
                duration: const Duration(seconds: 1),
                // O widget que terá a opacidade alterada (neste caso, um texto)
                child: const Text('Visível/Invisível', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 20),  // Espaço entre o texto e o botão
              // Botão que alterna a visibilidade
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Alterna o estado de _visible para mostrar ou esconder o texto
                    _visible = !_visible;
                  });
                },
                child: const Text('Alternar Visibilidade'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

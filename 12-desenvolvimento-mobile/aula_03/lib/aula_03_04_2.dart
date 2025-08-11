// Tema Específico para Widgets
//  2.	Tema Específico
//    Podemos definir temas específicos para widgets usando o widget Theme.

import 'package:flutter/material.dart';

// Função principal onde o programa começa a ser executado
void main() {
  runApp(const MyApp());  // Executa o aplicativo MyApp
}

// MyApp é o widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna o MaterialApp com a estrutura básica da aplicação
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // O título da AppBar
          title: const Text('Exemplo de Tema Específico'),
        ),
        body: Center(
          // Aplicando um tema específico a um conjunto de widgets
          child: Theme(
            // Definindo o tema específico para os widgets internos
            data: ThemeData(
              // Modificando o tema dos botões dentro desse tema específico
              buttonTheme: const ButtonThemeData(
                buttonColor: Colors.green,  // Define a cor do botão como verde
              ),
            ),
            // O widget filho dentro desse tema específico
            child: ElevatedButton(
              // Função que será chamada quando o botão for pressionado (sem funcionalidade aqui)
              onPressed: () {},
              // O texto exibido dentro do botão
              child: const Text('Tema Específico'),
            ),
          ),
        ),
      ),
    );
  }
}

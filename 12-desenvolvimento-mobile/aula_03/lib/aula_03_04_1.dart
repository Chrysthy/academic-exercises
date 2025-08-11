// Definindo Temas Globais
//  1.	Tema Global
//    O tema global é definido usando o widget MaterialApp e a classe ThemeData.

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
    // Retorna o MaterialApp, onde definimos o tema global do aplicativo
    return MaterialApp(
      // Definindo o tema global com a classe ThemeData
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define a cor principal do aplicativo (usada no AppBar, por exemplo)
        
        // Definindo um tema de texto global com a classe TextTheme
        textTheme: const TextTheme(
          // Estilo para bodyText1 (usado no corpo do aplicativo)
          bodyLarge: TextStyle(color: Colors.red, fontSize: 20),  // Define a cor e o tamanho do texto padrão
        ),
      ),
      
      // Definindo a página inicial do aplicativo
      home: Scaffold(
        appBar: AppBar(
          // O AppBar usa a cor definida como primarySwatch no tema global
          title: const Text('Tema Global'),
        ),
        body: const Center(
          // O texto aqui usa o tema global definido no TextTheme
          child: Text('Texto com tema personalizado'),  // O texto será exibido em vermelho e com tamanho 20
        ),
      ),
    );
  }
}

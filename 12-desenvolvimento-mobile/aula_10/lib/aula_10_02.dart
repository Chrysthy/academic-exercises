// Acessando Acelerômetros com Flutter
//  Passos para Acessar Acelerômetros
//    1.	Adicionar Dependências ao pubspec.yaml
//      sensors_plus: ^6.0.1
//    2.	Importar o Pacote sensors_plus
//    3.	Código para Acessar Dados do Acelerômetro

// Este código configura um listener para eventos do acelerômetro 
// e atualiza a interface do usuário com os valores do eixo X, Y e Z em tempo real.

import 'package:flutter/material.dart';  // Importa a biblioteca principal do Flutter para construção de interface de usuário.
import 'package:sensors_plus/sensors_plus.dart';  // Importa a biblioteca que acessa os sensores do dispositivo, como o acelerômetro.

void main() {
  runApp(const MyApp());  // Função principal que inicia o aplicativo.
}

// MyApp é o widget principal do aplicativo. Ele carrega a tela inicial chamada SensorScreen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema do aplicativo com tons de azul.
      ),
      home: const SensorScreen(),  // Define que a tela inicial do app será a classe SensorScreen.
    );
  }
}

// SensorScreen é a tela onde os dados do acelerômetro serão exibidos.
class SensorScreen extends StatefulWidget {
  const SensorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SensorScreenState createState() => _SensorScreenState();  // Cria o estado da tela.
}

// _SensorScreenState é a classe que gerencia o estado da tela. Aqui é onde os dados do acelerômetro são capturados.
class _SensorScreenState extends State<SensorScreen> {
  // Variáveis para armazenar os valores do acelerômetro nos eixos X, Y e Z.
  double x = 0.0, y = 0.0, z = 0.0;

  @override
  void initState() {
    super.initState();
    // Ouvinte para os eventos do acelerômetro. Quando há um novo valor, ele é capturado aqui.
    // ignore: deprecated_member_use
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;  // Atualiza o valor do eixo X.
        y = event.y;  // Atualiza o valor do eixo Y.
        z = event.z;  // Atualiza o valor do eixo Z.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // A tela é construída aqui.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 10.02 - Dados do Acelerômetro'),  // Título na barra superior.
        backgroundColor: Colors.blueAccent,  // Cor da barra superior.
      ),
      body: Center(
        // Coluna que organiza os elementos de texto verticalmente.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os elementos no meio da tela.
          children: [
            // Cada linha abaixo exibe os valores do acelerômetro em um dos eixos (X, Y, Z).
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],  // Fundo azul claro para o texto.
                borderRadius: BorderRadius.circular(10),  // Bordas arredondadas.
              ),
              child: Text(
                'Eixo X: $x',  // Mostra o valor atual do eixo X.
                style: TextStyle(fontSize: 24, color: Colors.blue[900]),  // Estilo do texto: grande e em azul escuro.
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],  // Fundo um pouco mais escuro.
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Eixo Y: $y',  // Mostra o valor atual do eixo Y.
                style: TextStyle(fontSize: 24, color: Colors.blue[900]),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],  // Fundo ainda mais escuro.
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Eixo Z: $z',  // Mostra o valor atual do eixo Z.
                style: TextStyle(fontSize: 24, color: Colors.blue[900]),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],  // Fundo da tela em azul claro.
    );
  }
}
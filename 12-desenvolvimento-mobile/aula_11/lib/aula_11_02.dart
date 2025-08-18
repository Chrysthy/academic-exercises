// Este aplicativo simula um wearable (dispositivo vestível) que rastreia passos. 
// Ele segue os princípios de design para wearables, garantindo simplicidade, legibilidade e interatividade.

import 'package:flutter/material.dart';

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O MaterialApp é o widget base que define o tema e a navegação do aplicativo
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema azul
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Define o fundo azul claro
      ),
      home: const WearableHomeScreen(),  // Define a tela inicial como 'WearableHomeScreen'
    );
  }
}

// Tela inicial do aplicativo (onde acontece a simulação do wearable)
class WearableHomeScreen extends StatefulWidget {
  const WearableHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WearableHomeScreenState createState() => _WearableHomeScreenState();
}

// Estado da tela inicial, onde a lógica de interação acontece
class _WearableHomeScreenState extends State<WearableHomeScreen> {
  // Variável para armazenar o número de passos simulados
  int _stepCount = 0;

  // Função que simula o incremento de passos quando o usuário interage
  void _simulateStep() {
    setState(() {
      _stepCount += 100;  // Aumenta o número de passos em 100
    });
  }

  // Função que zera o contador de passos
  void _resetStepCount() {
    setState(() {
      _stepCount = 0;  // Reinicia o contador de passos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação de Wearable'),  // Título da barra superior
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os widgets na tela
          children: [
            // Texto que mostra a quantidade de passos
            Text(
              'Passos Dados:',
              style: TextStyle(
                fontSize: 30,  // Fonte grande para legibilidade
                color: Colors.blue[900],  // Cor do texto azul escuro para bom contraste
              ),
            ),
            const SizedBox(height: 20),  // Espaçamento entre os textos
            Text(
              '$_stepCount',  // Mostra o número de passos
              style: TextStyle(
                fontSize: 50,  // Fonte ainda maior para dar destaque
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],  // Cor do número dos passos
              ),
            ),
            const SizedBox(height: 40),  // Espaçamento antes dos botões
            // Botão que simula a contagem de passos
            ElevatedButton(
              onPressed: _simulateStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,  // Cor do botão
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),  // Tamanho do botão
              ),  // Chama a função para incrementar os passos
              child: const Text(
                'Simular Passos',
                style: TextStyle(fontSize: 20),  // Texto grande e claro no botão
              ),
            ),
            const SizedBox(height: 20),  // Espaçamento entre os botões
            // Botão que zera a contagem de passos
            ElevatedButton(
              onPressed: _resetStepCount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,  // Cor do botão de reiniciar (vermelho para destaque)
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),  // Tamanho do botão
              ),  // Chama a função para zerar o contador
              child: const Text(
                'Reiniciar',
                style: TextStyle(fontSize: 20),  // Texto grande e claro no botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}

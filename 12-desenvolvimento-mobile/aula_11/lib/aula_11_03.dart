// Desenvolvendo Apps para Wearables com Flutter
//  Configuração do Projeto Flutter
//    1.	Criar um Novo Projeto Flutter
//      flutter create wearable_app
//    2.	Adicionar Dependências ao pubspec.yaml
//      wearable_communicator: ^1.0.0  # Exemplo de plugin para wearables
//  Exemplo de Aplicativo Simples para Wearables
//    1.	Código para um Aplicativo Simples

// Este é um aplicativo Flutter que simula um contador de passos (como em um smartwatch). 
// O aplicativo se conecta a um dispositivo vestível (wearable) usando o plugin wearable_communicator para obter o número de passos dados. 
// Ele exibe o número de passos em tempo real na tela.

import 'package:flutter/material.dart';  // Importa a biblioteca para construir a interface do app
import 'package:pedometer/pedometer.dart';  // Importa o pacote para contagem de passos

void main() {
  runApp(const MyWearableApp());
}

// Classe principal do aplicativo
class MyWearableApp extends StatelessWidget {
  const MyWearableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema azul para o aplicativo
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Fundo da tela em azul claro
      ),
      home: const StepCounterScreen(),  // Define a tela inicial como 'StepCounterScreen'
    );
  }
}

// Tela principal onde o contador de passos será exibido
class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepCounterScreenState createState() => _StepCounterScreenState();  // Cria o estado da tela
}

// Estado da tela, onde acontece a lógica de contar os passos
class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCountValue = '0';  // Variável para armazenar o número de passos

  @override
  void initState() {
    super.initState();
    // Inicializa o pedômetro para contar os passos
    Pedometer.stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  // Função chamada sempre que o número de passos é atualizado
  void onStepCount(StepCount event) {
    setState(() {
      _stepCountValue = event.steps.toString();  // Atualiza a variável com o número de passos
    });
  }

  // Função chamada se ocorrer um erro ao obter a contagem de passos
  void onStepCountError(error) {
    setState(() {
      _stepCountValue = 'Erro ao contar passos';  // Exibe mensagem de erro na interface
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Passos'),  // Título da barra superior
      ),
      // O corpo da tela contém o texto centralizado que mostra o número de passos
      body: Center(
        child: Text(
          'Passos: $_stepCountValue',  // Exibe o número de passos ou mensagem de erro
          style: TextStyle(
            fontSize: 24,  // Tamanho grande da fonte para facilitar a leitura
            color: Colors.blue[900],  // Texto em azul escuro para contraste
          ),
        ),
      ),
    );
  }
}
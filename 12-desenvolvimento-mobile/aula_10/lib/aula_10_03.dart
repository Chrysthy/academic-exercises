// Aplicações Práticas de Acelerômetros
//  Exemplo: Detecção de Movimento
//    1.	Código para Detecção de Movimento

// Este código detecta movimento baseado nos valores do acelerômetro e 
// atualiza a interface do usuário para exibir "Movimento detectado!" quando um movimento significativo é detectado.

import 'package:flutter/material.dart';  // Importa a biblioteca principal do Flutter para construção de interfaces.
import 'package:sensors_plus/sensors_plus.dart';  // Importa a biblioteca que permite acessar os sensores do dispositivo, como o acelerômetro.

void main() {
  runApp(const MyApp());  // Função principal que inicia o aplicativo.
}

// MyApp é o widget principal do aplicativo. Ele define a tela inicial do aplicativo como a classe MotionDetectionScreen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema do aplicativo em tons de azul.
      ),
      home: const MotionDetectionScreen(),  // Define a tela inicial do app.
    );
  }
}

// MotionDetectionScreen é a tela onde os dados do acelerômetro são processados para detectar movimento.
class MotionDetectionScreen extends StatefulWidget {
  const MotionDetectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MotionDetectionScreenState createState() => _MotionDetectionScreenState();  // Cria o estado da tela.
}

// _MotionDetectionScreenState controla o estado da tela, monitorando o sensor de movimento (acelerômetro).
class _MotionDetectionScreenState extends State<MotionDetectionScreen> {
  // Variável que armazena o status do movimento detectado.
  String motionStatus = "Nenhum movimento detectado";  // Inicia sem movimento detectado.

  @override
  void initState() {
    super.initState();
    // Ouvinte para os eventos do acelerômetro. Toda vez que há uma mudança no sensor, o código dentro desse bloco é executado.
    // ignore: deprecated_member_use
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Se houver um valor de aceleração significativo nos eixos X, Y ou Z, detecta movimento.
      if (event.x > 1 || event.y > 1 || event.z > 1) {
        setState(() {
          motionStatus = "Movimento detectado!";  // Atualiza a mensagem para indicar que o movimento foi detectado.
        });
      } else {
        setState(() {
          motionStatus = "Nenhum movimento detectado";  // Se não houver movimento significativo, a mensagem volta ao estado inicial.
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold é a estrutura básica da tela, com AppBar e corpo.
      appBar: AppBar(
        title: const Text('Aula 10.03 - Detecção de Movimento'),  // Título da barra superior (AppBar).
        backgroundColor: Colors.blueAccent,  // Cor azul da AppBar.
      ),
      body: Center(
        // O texto que exibe o status do movimento é centralizado na tela.
        child: Container(
          padding: const EdgeInsets.all(20),  // Adiciona espaçamento ao redor do texto.
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],  // Fundo azul claro para o texto.
            borderRadius: BorderRadius.circular(10),  // Bordas arredondadas para dar um efeito visual melhor.
            border: Border.all(color: Colors.blueAccent, width: 2),  // Adiciona uma borda ao redor do texto.
          ),
          child: Text(
            motionStatus,  // Exibe o status do movimento detectado.
            style: TextStyle(fontSize: 24, color: Colors.blue[900]),  // Estilo do texto: grande e azul escuro.
          ),
        ),
      ),
      backgroundColor: Colors.blue[100],  // Fundo da tela em azul claro.
    );
  }
}

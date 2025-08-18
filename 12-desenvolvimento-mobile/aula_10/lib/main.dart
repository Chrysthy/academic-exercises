// Tratamento e Filtragem de Dados de Sensores
//  Aplicando Filtros nos Dados do Acelerômetro
//    1.	Filtro de Média Móvel

// Este código aplica um filtro de média móvel aos dados do acelerômetro para 
// suavizar as leituras, reduzindo o ruído e proporcionando valores mais estáveis.

import 'package:flutter/material.dart';  // Importa a biblioteca principal para construção de interfaces no Flutter.
import 'dart:async';  // Necessário para criar um temporizador.
import 'dart:math';  // Necessário para gerar valores aleatórios.

void main() {
  runApp(const MyApp());  // Função principal que inicia o aplicativo.
}

// MyApp é o widget principal do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema em tons de azul.
      ),
      home: const SimulatedSensorScreen(),  // Define a tela inicial como SimulatedSensorScreen.
    );
  }
}

// Classe que define a tela e gerencia o estado.
class SimulatedSensorScreen extends StatefulWidget {
  const SimulatedSensorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SimulatedSensorScreenState createState() => _SimulatedSensorScreenState();
}

// _SimulatedSensorScreenState controla o estado da tela e simula o sensor.
class _SimulatedSensorScreenState extends State<SimulatedSensorScreen> {
  double x = 0.0, y = 0.0, z = 0.0;  // Variáveis para armazenar os valores simulados dos eixos X, Y e Z.
  Timer? timer;  // Timer que será usado para gerar dados em intervalos regulares.

  @override
  void initState() {
    super.initState();
    // Inicia o timer que gera novos dados de forma dinâmica a cada segundo.
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _simulateSensorData());
  }

  // Função que gera valores aleatórios para os eixos X, Y e Z, simulando um sensor de movimento.
  void _simulateSensorData() {
    setState(() {
      // Gera valores aleatórios entre -10.0 e 10.0 para os três eixos.
      x = Random().nextDouble() * 20 - 10;
      y = Random().nextDouble() * 20 - 10;
      z = Random().nextDouble() * 20 - 10;
    });
  }

  @override
  void dispose() {
    timer?.cancel();  // Cancela o timer quando a tela é destruída.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação de Sensor de Movimento'),  // Título da tela.
        backgroundColor: Colors.blueAccent,  // Cor da AppBar.
      ),
      body: Center(
        // Exibe os valores simulados do sensor de maneira organizada.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os widgets na tela.
          children: [
            _buildSensorDataCard('Eixo X', x),  // Mostra o valor do eixo X.
            _buildSensorDataCard('Eixo Y', y),  // Mostra o valor do eixo Y.
            _buildSensorDataCard('Eixo Z', z),  // Mostra o valor do eixo Z.
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],  // Define o fundo da tela em azul claro.
    );
  }

  // Widget que constrói cada cartão de dados do sensor (X, Y, Z).
  Widget _buildSensorDataCard(String axis, double value) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],  // Fundo azul claro.
        borderRadius: BorderRadius.circular(10),  // Bordas arredondadas.
        border: Border.all(color: Colors.blueAccent, width: 2),  // Borda em azul.
      ),
      child: Text(
        '$axis: ${value.toStringAsFixed(2)}',  // Exibe o nome do eixo e o valor formatado com duas casas decimais.
        style: TextStyle(fontSize: 24, color: Colors.blue[900]),  // Estilo do texto: grande e azul escuro.
      ),
    );
  }
}

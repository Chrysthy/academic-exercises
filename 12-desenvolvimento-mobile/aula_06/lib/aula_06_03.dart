// Leitura de Tags NFC
//  Passos para Ler Tags NFC
//    1.	Adicionar Dependências ao pubspec.yaml
//    2.	Configurar AndroidManifest.xml
//        Certifique-se de que as permissões e filtros de intenções estão configurados corretamente (conforme explicado na Aula 02).
//    3.	Código para Leitura de Tags NFC

// Este exemplo mostra como iniciar uma sessão NFC e ler os dados de uma tag NFC quando ela é detectada.

import 'package:flutter/material.dart'; // Biblioteca para construir a interface gráfica.

void main() {
  runApp(
      const MyApp()); // O Flutter começa a executar o aplicativo, chamando a classe MyApp.
}

// Classe principal do aplicativo, representando toda a interface.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que configura a aparência básica do aplicativo.
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define uma paleta de cores em tons de azul.
        scaffoldBackgroundColor:
            Colors.lightBlue[50], // Cor de fundo padrão da tela.
      ),
      home: const HomeScreen(), // Define que a tela inicial será HomeScreen.
    );
  }
}

// Tela inicial do aplicativo, que pode mudar de estado (Stateful).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() =>
      _HomeScreenState(); // Cria o estado da tela.
}

// Estado associado à HomeScreen, onde a lógica de NFC será gerenciada.
class _HomeScreenState extends State<HomeScreen> {
  // Variável que armazena os dados da tag NFC lida, começando com o valor padrão "Nenhuma tag lida".
  String _nfcData = 'Nenhuma tag lida';

  // Variável que armazena a cor de fundo da tela. Inicialmente, será um tom claro de azul.
  Color _backgroundColor = Colors.lightBlue[100]!;

  // Função que simula a leitura de uma tag NFC, sem o uso de um dispositivo real.
  void _simulateNfcReading() {
    setState(() {
      // Simula a leitura de uma tag NFC com um ID fictício e altera a cor de fundo para um tom mais escuro de azul.
      _nfcData = 'Realizando leitura Tag NFC: ID = 12345ABC';
      _backgroundColor = Colors
          .blue[700]!; // Altera a cor de fundo para um tom mais escuro de azul.
    });

    // Após 2 segundos, a cor de fundo retorna para um tom claro de azul e a tag lida é redefinida.
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _nfcData = 'Nenhuma tag lida - aproxime o dispositivo'; // Reseta o texto da tag NFC.
        _backgroundColor = Colors.lightBlue[
            100]!; // Retorna a cor de fundo para um tom claro de azul.
      });
    });
  }

  // Função que constrói a interface da tela.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Simulação de Leitura NFC'), // Título exibido na barra superior.
      ),
      body: AnimatedContainer(
        // O AnimatedContainer permite uma animação suave nas mudanças de cor.
        duration: const Duration(
            milliseconds: 500), // Animação suave de transição de cor.
        color: _backgroundColor, // Define a cor de fundo com base no estado.
        child: Center(
          // Organiza o conteúdo central da tela.
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza o conteúdo na tela.
            children: [
              // Exibe os dados simulados da tag NFC.
              Text(
                'Dados da tag: $_nfcData', // Exibe os dados lidos (ou "Nenhuma tag lida").
                style: const TextStyle(
                    fontSize: 20,
                    color:
                        Colors.white), // Texto com fonte grande e cor branca.
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre o texto e o botão.
              ElevatedButton(
                onPressed:
                    _simulateNfcReading, // Chama a função de simulação ao pressionar o botão.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Cor do botão em tom de azul.
                ),
                child: const Text('Simular Leitura de NFC'), // Texto do botão.
              ),
            ],
          ),
        ),
      ),
    );
  }
}

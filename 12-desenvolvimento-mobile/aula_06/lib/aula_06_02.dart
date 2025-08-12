// Configurando Near Field Communication (NFC) no Flutter
//  Passos para Configurar NFC
//    1.	Adicionar Dependências ao pubspec.yaml
//        nfc_manager: latest_version
//    2.	Configurar AndroidManifest.xml
//        Adicione as permissões necessárias e configure o filtro de intenções para o NFC.
//    3.	Criar o arquivo res/xml/nfc_tech_filter.xml
//        Este arquivo define os tipos de tags NFC que seu aplicativo pode ler.
//    4.	Inicializar o NFC no Flutter

// Este exemplo mostra como configurar o NFC no Flutter, 
// incluindo a verificação de disponibilidade do NFC no dispositivo.

import 'package:flutter/foundation.dart';  // Importa bibliotecas essenciais para o Flutter.
import 'package:flutter/material.dart';  // Importa ferramentas para construir a interface gráfica.
import 'package:nfc_manager/nfc_manager.dart';  // Importa o pacote para trabalhar com NFC (Near Field Communication).

void main() {
  runApp(const MyApp());  // O Flutter começa a executar o aplicativo chamando a classe MyApp.
}

// Classe principal do aplicativo, responsável por estruturar a interface do app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configura o tema com tons de azul.
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define a cor principal como azul.
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Fundo com tom suave de azul.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,  // Cor da AppBar.
        ),
      ),
      home: const HomeScreen(),  // Define que a tela inicial será a HomeScreen.
    );
  }
}

// Classe que representa a tela inicial (HomeScreen) do aplicativo.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

// Estado associado à HomeScreen. Aqui é onde controlamos o que acontece na tela.
class _HomeScreenState extends State<HomeScreen> {
  String _nfcData = 'Aguardando leitura de tags NFC';  // Mensagem inicial de espera.

  @override
  void initState() {
    super.initState();
    
    // Verifica se o NFC está disponível no dispositivo.
    NfcManager.instance.isAvailable().then((isAvailable) {
      if (isAvailable) {
        // Mostra a mensagem informando que o dispositivo está configurado para NFC.
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Equipamento configurado para interagir com NFC'),
            duration: Duration(seconds: 2),
          ),
        );
        
        if (kDebugMode) {
          print('NFC está disponível');
        }
        _simulateNfcTagDiscovery();  // Simula a leitura de uma tag NFC.
      } else {
        if (kDebugMode) {
          print('NFC não está disponível');
        }
      }
    });
  }

  // Simula a descoberta de uma tag NFC.
  void _simulateNfcTagDiscovery() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _nfcData = 'Tag NFC simulada: ID = 12345ABC';  // Simula a leitura de uma tag.
      });

      if (kDebugMode) {
        print('Tag NFC simulada lida: ID = 12345ABC');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração NFC'),  // Título da AppBar.
      ),
      body: Center(
        child: Text(
          _nfcData,  // Exibe os dados da tag ou a mensagem de espera.
          style: const TextStyle(fontSize: 20, color: Colors.blueAccent),  // Texto estilizado.
        ),
      ),
    );
  }
}
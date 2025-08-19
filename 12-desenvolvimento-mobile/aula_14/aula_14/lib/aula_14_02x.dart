// Integrando Firebase com Flutter
//  Configurando Firebase no Projeto Flutter
//    1.	Adicionar Dependências ao pubspec.yaml
//      dependencies:
//        firebase_core: latest_version
//        firebase_auth: latest_version
//        cloud_firestore: latest_version
//    2.	Instalar Dependências
//        flutter pub get
//    3.	Configuração no Firebase Console
//        Acesse o Firebase Console.
//        Crie um novo projeto ou use um existente.
//      	Adicione um novo aplicativo (Android/iOS).
//      	Baixe o arquivo google-services.json (Android) ou GoogleService-Info.plist (iOS) e adicione ao projeto.
//    4.	Configurar o main.dart

// Este código inicializa o Firebase no aplicativo Flutter e exibe uma mensagem de sucesso na tela inicial.

// Importa os pacotes necessários para o Flutter, Firebase e Firestore.
import 'package:flutter/material.dart'; // Pacote principal para criar aplicativos com interface no Flutter.
import 'package:firebase_core/firebase_core.dart'; // Pacote para inicializar o Firebase no aplicativo.
// Pacote para acessar o Firestore, banco de dados do Firebase.

// Função principal do aplicativo, onde tudo começa.
void main() async {
  // Certifica-se de que todos os widgets estão prontos antes de iniciar o app (necessário ao usar o Firebase).
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase, necessário antes de qualquer interação com os serviços do Firebase.
  await Firebase.initializeApp();
  
  // Executa o aplicativo e chama a classe MyApp, que define a estrutura básica do app.
  runApp(const MyApp());
}

// Classe principal do aplicativo, que é um widget "stateless" (sem estado).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Função que constrói a interface do app. Aqui, o MaterialApp é usado para definir a base do aplicativo.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Define que a tela inicial do app será o widget HomeScreen.
      home: HomeScreen(),
    );
  }
}

// Classe que define a tela principal (ou "home screen") do aplicativo, também é um widget "stateless".
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Função que constrói a interface da tela principal.
  @override
  Widget build(BuildContext context) {
    // O Scaffold é a estrutura básica de uma página no Flutter (barra de app, corpo, etc.).
    return Scaffold(
      // Define a barra superior da tela (AppBar) com um título.
      appBar: AppBar(
        title: const Text('Firebase Integration'), // Texto que aparece na barra do app.
      ),
      // Define o corpo da tela principal. Aqui, temos um texto centralizado.
      body: const Center(
        child: Text('Firebase integrado com sucesso!'), // Exibe uma mensagem no centro da tela.
      ),
    );
  }
}

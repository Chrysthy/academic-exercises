import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// Função principal do aplicativo que garante que o Firebase seja inicializado antes do runApp
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter seja inicializado corretamente
  await Firebase.initializeApp(); // Inicializa o Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(), // Define a HomeScreen como a tela inicial do app
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Registro de evento no Firebase Analytics
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'screen_name': 'HomeScreen',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Analytics'),
      ),
      body: const Center(
        child: Text('Bem-vindo ao Firebase Analytics!'),
      ),
    );
  }
}


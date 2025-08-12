import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  // Inicializa os serviços do Flutter
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gerar Token FCM'),
        ),
        body: const TokenScreen(),  // O widget que vai gerar o token
      ),
    );
  }
}

class TokenScreen extends StatefulWidget {
  const TokenScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TokenScreenState createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  String? _fcmToken;

  // Função para gerar o token FCM
  Future<void> _generateFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Solicita permissão para notificações (necessário para iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Obtém o token FCM
      String? token = await messaging.getToken();
      setState(() {
        _fcmToken = token;
      });
      if (kDebugMode) {
        print('Token do FCM: $token');
      }
    } else {
      if (kDebugMode) {
        print('Permissão de notificações não concedida');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _generateFCMToken,  // Botão para gerar o token
            child: const Text('Gerar Token FCM'),
          ),
          const SizedBox(height: 20),
          Text(
            _fcmToken != null ? 'Token FCM: $_fcmToken' : 'Pressione o botão para gerar o token',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

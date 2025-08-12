// Enviando Mensagens do Firebase Console
//  1.	Acessar o Firebase Console
//    Navegue até o projeto no Firebase Console.
//  	Selecione Cloud Messaging no menu à esquerda.
//  2.	Criar e Enviar Mensagem
//    Clique em "Send your first message".
//    Preencha o título e o corpo da mensagem.
//    Selecione o aplicativo alvo.
//    Clique em "Next" e "Review" e depois "Send".
// Enviando Mensagens Programaticamente
//  1.	Configurar Servidor para Enviar Mensagens
//  	Use a biblioteca firebase-admin para enviar mensagens.
//    Exemplo em Node.js:
//  2.	Exemplo de Código Completo em Dart

// Este código inicializa o Firebase, obtém o token FCM do dispositivo 
// e escuta mensagens recebidas enquanto o aplicativo está em primeiro plano.

// Importa as bibliotecas necessárias para construir a interface e usar o Firebase.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// A função principal do Flutter que é executada quando o aplicativo é iniciado
void main() async {
  // Garante que o Flutter esteja inicializado corretamente
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase para ser usado no aplicativo
  await Firebase.initializeApp();

  // Inicia o aplicativo chamando o widget MyApp
  runApp(const MyApp());
}

// O widget principal do aplicativo, que define a estrutura básica
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notification Test', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal como azul
      ),
      home: const PushNotificationScreen(), // Tela principal do aplicativo
    );
  }
}

// Widget responsável por exibir a tela onde o botão e as mensagens aparecerão
class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

// Estado do widget PushNotificationScreen, onde o comportamento dinâmico é gerenciado
class _PushNotificationScreenState extends State<PushNotificationScreen> {
  
  // Variável para armazenar a mensagem que será exibida na tela
  String message = "Aguardando Mensagens Push...";

  @override
  void initState() {
    super.initState();
    // Função para configurar o recebimento de mensagens via Firebase
    _initializeFirebaseMessaging();
  }

  // Função que inicializa o Firebase Messaging e escuta as mensagens recebidas
  void _initializeFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Solicita permissões para notificações (necessário especialmente para iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,  // Permitir alertas (som, visual)
      badge: true,  // Permitir que ícones tenham badgets (contadores)
      sound: true,  // Permitir som para as notificações
    );

    // Verifica se o usuário deu permissão para receber notificações
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('Permissão concedida para enviar notificações');
      }
    }

    // Escuta as mensagens recebidas enquanto o aplicativo está em uso (primeiro plano)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Quando uma mensagem é recebida, atualiza o estado da variável "message"
      setState(() {
        this.message = "Mensagem recebida: Teste\nTestando";
      });
    });
  }

  // Função executada quando o botão é clicado
  void _onButtonPressed() {
    // Atualiza o estado da variável "message" para exibir "Teste\nTestando"
    setState(() {
      message = "Teste\nTestando";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notification Test"), // Título da barra superior
      ),
      body: Center(
        // Coluna que organiza os elementos na tela de forma vertical
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
          children: [
            // Exibe a mensagem dinâmica que é atualizada pelo botão ou por push notification
            Text(
              message,
              textAlign: TextAlign.center, // Centraliza o texto
              style: const TextStyle(fontSize: 20), // Define o tamanho do texto
            ),
            const SizedBox(height: 20), // Espaçamento entre a mensagem e o botão
            // Botão que, ao ser clicado, altera a mensagem na tela
            ElevatedButton(
              onPressed: _onButtonPressed, // Chama a função _onButtonPressed quando clicado
              child: const Text("Clique para Testar"), // Texto dentro do botão
            ),
          ],
        ),
      ),
    );
  }
}
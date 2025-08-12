// Importa as bibliotecas necessárias para construir a interface e usar o Firebase
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
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

// Estado do widget PushNotificationScreen, onde o comportamento dinâmico é gerenciado
class _PushNotificationScreenState extends State<PushNotificationScreen> {
  
  // Variável para armazenar a mensagem que será exibida na tela
  String message = "Aguardando Mensagens Push...";

  // Variável que controla se o campo de resposta e o botão "Enviar" devem aparecer
  bool _isResponseFieldVisible = false;

  // Controlador do campo de texto para a resposta
  final TextEditingController _responseController = TextEditingController();

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
      print('Permissão concedida para enviar notificações');
    }

    // Escuta as mensagens recebidas enquanto o aplicativo está em uso (primeiro plano)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Quando uma mensagem é recebida, atualiza o estado da variável "message"
      setState(() {
        this.message = "Mensagem recebida:\n${message.notification?.title}\n${message.notification?.body}";
        _isResponseFieldVisible = true;  // Exibe o campo de resposta e o botão "Enviar" quando a mensagem é recebida
      });
    });
  }

  // Função executada quando o botão "Clique para Testar" é clicado
  void _onButtonPressed() {
    setState(() {
      message = "Teste\nTestando";  // Atualiza o estado da variável "message"
      _isResponseFieldVisible = true; // Exibe o campo de resposta após o clique
    });
  }

  // Função para enviar a resposta escrita no campo
  void _sendResponse() {
    String response = _responseController.text;
    if (response.isNotEmpty) {
      // Exibe a resposta no console (você pode expandir para enviar a resposta para um servidor)
      print("Resposta enviada: $response");
      setState(() {
        message = "Resposta enviada"; // Atualiza a tela com a mensagem "Resposta enviada"
        _responseController.clear();  // Limpa o campo de texto
        _isResponseFieldVisible = false;  // Oculta o campo de resposta após enviar
      });
    }
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
            const SizedBox(height: 20), // Espaçamento entre o botão e o próximo elemento

            // Campo de resposta e botão "Enviar" aparecem após o clique no botão ou ao receber uma mensagem
            if (_isResponseFieldVisible)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Campo de texto para digitar a resposta
                    TextField(
                      controller: _responseController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escreva sua resposta',
                      ),
                    ),
                    const SizedBox(height: 10),  // Espaçamento entre o campo de texto e o botão
                    // Botão para enviar a resposta
                    ElevatedButton(
                      onPressed: _sendResponse,  // Chama a função _sendResponse ao clicar
                      child: const Text('Enviar Resposta'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

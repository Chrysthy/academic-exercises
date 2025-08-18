// Recebendo e Respondendo a Mensagens Push
//  Lidando com Mensagens em Diferentes Estados do Aplicativo
//    1.	Mensagens em Primeiro Plano
//      Utilize FirebaseMessaging.onMessage para lidar com mensagens recebidas enquanto o aplicativo está aberto.
//    2.	Mensagens em Segundo Plano e Fechado
//      Utilize FirebaseMessaging.onMessageOpenedApp para lidar com mensagens que abriram o aplicativo a partir de um estado fechado ou em segundo plano.
//    3.	Configurar Notificações na Inicialização do App
//      Utilize FirebaseMessaging.instance.getInitialMessage() para lidar com mensagens que abriram o aplicativo quando estava fechado.
// Personalizando Notificações
//    1.	Exibir Notificações Personalizadas
//      Utilize pacotes como flutter_local_notifications para personalizar a exibição de notificações.

// Este exemplo utiliza flutter_local_notifications para exibir notificações
// personalizadas quando o aplicativo recebe mensagens enquanto está em primeiro plano.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o Firebase core para inicialização
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Se você estiver usando notificações push

// Cria um objeto para gerenciar notificações locais no dispositivo
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Função principal que inicia o aplicativo
Future<void> main() async {
  // Garante que o Flutter seja corretamente inicializado
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase (necessário para funcionalidades como notificações push)
  await Firebase.initializeApp();

  // Configurações específicas para notificações no Android
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // Define o ícone da notificação

  // Configurações gerais de inicialização para notificações
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // Inicializa o plugin de notificações com as configurações definidas
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Ouvinte para mensagens push enquanto o aplicativo está aberto
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Extrai a notificação recebida
    RemoteNotification? notification = message.notification;
    // Verifica se a notificação contém informações específicas para Android
    AndroidNotification? android = message.notification?.android;

    // Se a notificação tiver conteúdo e for para Android, exibe a notificação
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode, // ID único para a notificação
        notification.title ?? 'Sem título', // Título da notificação
        notification.body ?? 'Sem corpo', // Corpo da notificação
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id', // ID do canal de notificação
            'your_channel_name', // Nome do canal de notificação
          //  'your_channel_description', // Descrição do canal
            importance: Importance.max, // Importância máxima da notificação
            priority: Priority.high, // Alta prioridade
          ),
        ),
      );
    }
  });

  // Inicia o aplicativo chamando o widget principal MyApp
  runApp(const MyApp());
}

// Define a estrutura principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o contêiner que define a estrutura básica do app (temas, navegação, etc.)
    return const MaterialApp(
      home: HomeScreen(), // Define a tela inicial do aplicativo como HomeScreen
    );
  }
}

// Um widget que representa a tela inicial do aplicativo
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

// O estado da tela HomeScreen, que pode ser atualizado dinamicamente
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Scaffold define a estrutura básica da tela (barra de título, corpo, etc.)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recebendo Mensagens Push'), // Título da barra superior
      ),
      body: const Center(
        // Exibe uma mensagem no centro da tela informando que está aguardando mensagens
        child: Text('Aguardando Mensagens Push...'),
      ),
    );
  }
}


// Configurando o GCM no seu aplicativo
//  Passos para Configurar GCM
//    1.  Registrar seu Projeto no Firebase
//      Acesse o Firebase Console.
//      Crie um novo projeto ou use um existente.
//      Adicione seu aplicativo Android e iOS ao projeto.
//    2.  Adicionar Dependências ao pubspec.yaml
//      firebase_core: latest_version
//      firebase_messaging: latest_version
//    3.  Configurar Android
//      Adicione o arquivo google-services.json ao diretório android/app.
//      Atualize android/build.gradle:
//    4.  Configurar iOS
//      Adicione o arquivo GoogleService-Info.plist ao diretório ios/Runner.
//      Abra o arquivo ios/Runner/Info.plist e adicione:
//     5. Inicializar Firebase no Flutter

// Este exemplo mostra como inicializar o Firebase no Flutter e 
// obter um token FCM, que é necessário para receber mensagens push.

// Importa o pacote 'flutter/material.dart', que contém as ferramentas básicas
// para construir uma interface de usuário no Flutter.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Importa o pacote 'firebase_core.dart', que permite a inicialização do Firebase.
import 'package:firebase_core/firebase_core.dart';
// Importa o pacote 'firebase_messaging.dart', que permite o uso do serviço de
// mensagens push (Firebase Cloud Messaging).
import 'package:firebase_messaging/firebase_messaging.dart';

// A função principal do aplicativo. O "async" permite que o código seja executado
// de forma assíncrona, ou seja, sem bloquear outras operações enquanto espera por respostas.
void main() async {

  // Garante que o Flutter seja inicializado corretamente antes de fazer qualquer outra coisa.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase no aplicativo, permitindo o uso de seus serviços.
  await Firebase.initializeApp();
  
  // Executa o aplicativo Flutter, iniciando a interface gráfica.
  runApp(const MyApp());
}

// Definição do widget principal do aplicativo, que é "MyApp".
// StatelessWidget significa que este widget não muda depois de ser construído.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O método build define a interface de usuário do aplicativo.
    // Neste caso, é retornado um MaterialApp (estrutura básica do app Flutter)
    // com a tela inicial sendo o "HomeScreen".
    return const MaterialApp(
      home: HomeScreen(), // Define a primeira tela que o usuário verá ao abrir o app.
    );
  }
}

// Definição de um widget chamado "HomeScreen", que será a tela principal do aplicativo.
// StatefulWidget é usado quando o estado (dados) do widget pode mudar durante a execução.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Cria o estado da tela.
}

// Classe que gerencia o estado da "HomeScreen".
class _HomeScreenState extends State<HomeScreen> {
  // O initState é chamado uma única vez quando o widget é criado.
  @override
  void initState() {
    super.initState(); // Chama o initState da classe pai para garantir que tudo seja configurado corretamente.
    
    // Obtém o token do Firebase Cloud Messaging (FCM) que identifica o dispositivo
    // para receber notificações push. O token é então impresso no console.
    FirebaseMessaging.instance.getToken().then((token) {
      if (kDebugMode) {
        print("FCM Token: $token");
      } // Exibe o token no console (usado para testes e depuração).
    });
  }

  // O método build é chamado para construir a interface gráfica da tela.
  @override
  Widget build(BuildContext context) {
    // Scaffold é a estrutura básica de layout de uma tela no Flutter.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração GCM'), // Define o título da barra superior.
      ),
      body: const Center(
        // Exibe uma mensagem de texto centralizada na tela.
        child: Text('Firebase Messaging Configurado!'),
      ),
    );
  }
}
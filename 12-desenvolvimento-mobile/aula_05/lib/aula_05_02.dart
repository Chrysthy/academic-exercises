// Configurando o GCM (Google Cloud Messaging) no seu aplicativo
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

// Importa os pacotes necessários.
// O pacote 'material.dart' é usado para criar a interface do usuário no Flutter.
// O pacote 'firebase_core.dart' é necessário para inicializar o Firebase no aplicativo.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// A função 'main' é o ponto de entrada do aplicativo.
// 'async' significa que essa função pode lidar com operações assíncronas (operações que levam tempo para ser concluídas).
void main() async {
  // Garante que o Flutter esteja totalmente inicializado antes de continuar.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase. Isso é necessário para conectar o aplicativo ao Firebase.
  await Firebase.initializeApp();
  
  // Executa o aplicativo. Ele exibe a interface de usuário que você configurou.
  runApp(const MyApp());
}

// 'MyApp' é o widget principal do aplicativo.
// Um widget é como um "bloco de construção" da interface de usuário no Flutter.
class MyApp extends StatelessWidget {
  // Construtor da classe 'MyApp'. O 'super.key' é usado para identificar este widget.
  const MyApp({super.key});

  // O método 'build' cria a interface de usuário do aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // O 'Scaffold' é como uma "estrutura" básica para a interface de usuário. Ele define uma barra de título e um corpo.
      home: Scaffold(
        // A 'AppBar' é a barra de título que aparece na parte superior do aplicativo.
        appBar: AppBar(
          title: const Text('GCM/FCM Example'),  // Título da barra de título.
        ),
        // O 'body' é a área principal do aplicativo, onde você coloca o conteúdo.
        body: const Center(
          // Exibe uma mensagem de texto no centro da tela informando que as notificações push estão configuradas.
          child: Text('Notificações push configuradas'),
        ),
      ),
    );
  }
}

// Segurança e Privacidade na Cloud
//  Práticas Recomendadas de Segurança
//    1.	Autenticação e Autorização
//    	OAuth2: Utilize OAuth2 para autenticação e autorização seguras.
//    	Tokens JWT: Utilize JSON Web Tokens (JWT) para gerenciar sessões de usuário.
//    2.	Encriptação de Dados
//    	Em Trânsito: Utilize HTTPS para garantir a segurança dos dados em trânsito.
//    	Em Repouso: Utilize encriptação AES para proteger dados armazenados.
//  Implementando OAuth2 com Flutter
//    1.	Adicionar Dependências ao pubspec.yaml
//      dependencies:
//         oauth2: latest_version
//    2.	Configuração OAuth2
// 
//  Monitoramento e Gerenciamento de Acessos
//    1.	Gerenciamento de Acessos
//      Utilize políticas de acesso baseadas em papéis (RBAC) para controlar quem pode acessar os recursos.
//      Monitore atividades suspeitas e configure alertas para eventos de segurança.
//    2.	Ferramentas de Monitoramento
//    	AWS CloudTrail: Para monitorar atividades na AWS.
//    	Google Cloud Audit Logging: Para monitorar atividades no GCP.
//  Exemplo de Implementação de Logs de Auditoria
//    1.	Configuração de Logs de Auditoria no Firebase

import 'package:flutter/material.dart'; 
import 'package:firebase_core/firebase_core.dart'; // Importa o Firebase Core, necessário para iniciar o Firebase
import 'package:firebase_analytics/firebase_analytics.dart'; // Importa o Firebase Analytics para rastrear eventos

// Função principal do aplicativo
// Essa função é chamada quando o aplicativo é iniciado
void main() async {
  // Certifica-se de que o Flutter foi inicializado antes de rodar o app
  WidgetsFlutterBinding.ensureInitialized(); 

  // Inicializa o Firebase, permitindo que o app use os serviços do Firebase
  await Firebase.initializeApp(); 

  // Inicia o aplicativo rodando o widget MyApp
  runApp(const MyApp());
}

// Define o widget principal do aplicativo
class MyApp extends StatelessWidget {
  // Construtor do widget MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // O widget `MaterialApp` fornece a estrutura básica para o app, seguindo o design Material do Google.
      home: const HomeScreen(), // Define a `HomeScreen` como a primeira tela que será exibida no aplicativo.
      
      // Adiciona um observador para monitorar eventos de navegação do app e enviar dados ao Firebase Analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance), // Envia informações de navegação para o Firebase Analytics
      ],
    );
  }
}

// Define a tela inicial do aplicativo (HomeScreen)
class HomeScreen extends StatelessWidget {
  // Construtor do widget HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Registra um evento personalizado no Firebase Analytics, indicando que a tela HomeScreen foi visualizada
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view', // Nome do evento que será enviado ao Firebase
      parameters: {
        'screen_name': 'HomeScreen', // Parâmetro que define o nome da tela visualizada
      },
    );

    // Retorna o layout da tela com uma AppBar (barra superior) e um corpo centralizado com texto
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Analytics'), // Define o título que aparece na barra superior
      ),
      body: const Center(
        child: Text('Bem-vindo ao Firebase Analytics!'), // Exibe uma mensagem no centro da tela
      ),
    );
  }
}

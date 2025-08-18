// Passos para Configurar e Autenticar APIs
//  1.	Criar um Projeto no Google Cloud Console
//    Acesse o Google Cloud Console.
//    Crie um novo projeto ou use um existente.
//  2.	Habilitar a API Desejada
//    No painel do Google Cloud Console, navegue até a biblioteca de APIs.
//    Pesquise e habilite a API que deseja usar (por exemplo, Google Drive API).
//  3.	Obter Credenciais de API
//    Vá para "Credenciais" no menu de navegação.
//    Clique em "Criar credenciais" e selecione "ID do Cliente OAuth 2.0".
//    Configure a tela de consentimento OAuth.
//    Baixe o arquivo JSON com as credenciais.
//  4.	Adicionar Dependências ao pubspec.yaml
//    googleapis: latest_version
//    googleapis_auth: latest_version
//    http: ^0.13.3
//  5.	Configurar Autenticação no Flutter

// Este exemplo mostra como configurar a autenticação OAuth 2.0 no Flutter, 
// permitindo que o usuário faça login e conceda permissões ao aplicativo.

// Como Funciona:
//  O aplicativo inicia e exibe um botão que diz "Autenticar com Google".
//  Ao clicar no botão, o aplicativo solicita a autenticação no Google.
//  Se o login for bem-sucedido, o aplicativo acessa o Google Drive e lista os arquivos.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  // Importa o Flutter para criar a interface do app
import 'package:googleapis/drive/v3.dart' as drive;  // Importa a API do Google Drive
import 'package:googleapis_auth/auth_io.dart';  // Importa a autenticação OAuth do Google
// Importa para fazer requisições HTTP

void main() {
  runApp(const MyApp());  // Inicializa o aplicativo
}

// Este widget representa todo o aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define o MaterialApp com a tela inicial (HomeScreen)
    return MaterialApp(
      theme: ThemeData(  // Define o tema do aplicativo usando tons de azul
        primarySwatch: Colors.blue,  // Cor principal azul
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Fundo da tela em um tom claro de azul
      ),
      home: const HomeScreen(),  // Define a tela inicial
    );
  }
}

// Widget da tela inicial do aplicativo, que pode mudar de estado (interativo).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();  // Cria o estado da tela
}

// Estado da tela, onde colocamos a lógica do que acontece quando interagimos com o app.
class _HomeScreenState extends State<HomeScreen> {
  
  // Configura as credenciais do app para usar a API do Google
  final _clientId = ClientId('xxxxxx.apps.googleusercontent.com', 'xxxxxxxxx');
  final _scopes = [drive.DriveApi.driveFileScope];  // Definimos o que o app poderá fazer no Google Drive

  // Função que faz a autenticação com o Google para acessar o Google Drive
  Future<void> _authenticate() async {
    // Chama a função de autenticação, abrindo um link de login para o usuário
    await clientViaUserConsent(_clientId, _scopes, (url) {
      if (kDebugMode) {
        if (kDebugMode) {
          if (kDebugMode) {
            print('Por favor, faça login em: $url');
          }
        }
      }  // Mostra a URL de login para o usuário
      // O usuário deve copiar essa URL e fazer login no Google para dar permissão
    }).then((authClient) {
      // Se o login for bem-sucedido, criamos o cliente da API do Google Drive
      final driveApi = drive.DriveApi(authClient);
      // Agora podemos listar os arquivos do Google Drive
      _listFiles(driveApi);  // Função que lista os arquivos no Google Drive
    }).catchError((e) {
      // Se houver um erro na autenticação, ele será exibido no console
      if (kDebugMode) {
        print('Erro na autenticação: $e');
      }
    });
  }

  // Função que lista os arquivos armazenados no Google Drive
  Future<void> _listFiles(drive.DriveApi driveApi) async {
    final fileList = await driveApi.files.list();  // Pega a lista de arquivos no Drive
    // Para cada arquivo encontrado, imprime o nome do arquivo no console
    fileList.files?.forEach((file) {
      if (kDebugMode) {
        print('Encontrado arquivo: ${file.name}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Constrói a interface da tela
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação Google API'),  // Título da barra superior
      ),
      body: Center(
        // Cria um botão central para iniciar a autenticação
        child: ElevatedButton(
          onPressed: _authenticate,  // Quando o botão é clicado, chama a função de autenticação
          child: const Text('Autenticar com Google'),  // Texto exibido no botão
        ),
      ),
    );
  }
}
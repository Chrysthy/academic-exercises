// Usando a API Google Drive no Flutter
//  Listar Arquivos no Google Drive
//    1.	Adicionar Dependências ao pubspec.yaml
//    2.	Código para Listar Arquivos

// Este código autentica o usuário e lista os arquivos armazenados no Google Drive, exibindo-os em uma lista.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  // Biblioteca Flutter para criar a interface
import 'package:googleapis/drive/v3.dart' as drive;  // Biblioteca para acessar a API do Google Drive
import 'package:googleapis_auth/auth_io.dart';  // Biblioteca para autenticar o usuário
// Biblioteca para fazer requisições HTTP (usada internamente)

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp());
}

// Classe que define o aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo as cores do aplicativo usando tons de azul
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tom de azul principal
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Define o fundo da tela como azul claro
      ),
      home: const HomeScreen(),  // Define a tela inicial como 'HomeScreen'
    );
  }
}

// A tela inicial do aplicativo, onde o usuário pode se autenticar e ver os arquivos do Google Drive
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();  // Cria o estado da tela, onde a lógica acontece
}

// Classe que controla o estado da 'HomeScreen'
class _HomeScreenState extends State<HomeScreen> {
  // Credenciais necessárias para autenticar com o Google Drive
  final _clientId = ClientId('xxxxxxxxxxxx.apps.googleusercontent.com', 'YOUR_CLIENT_SECRET');  // Substitua pelos seus dados de cliente OAuth
  final _scopes = [drive.DriveApi.driveFileScope];  // Escopo que define as permissões para acessar o Google Drive

  List<String> _files = [];  // Lista que armazena os nomes dos arquivos encontrados no Google Drive

  // Função para autenticar o usuário com o Google
  Future<void> _authenticate() async {
    await clientViaUserConsent(_clientId, _scopes, (url) {
      // Aqui o aplicativo solicita que o usuário faça login no Google via navegador
      if (kDebugMode) {
        print('Por favor, faça login em: $url');
      }  // Exibe a URL de login no console
    }).then((authClient) {
      // Após o login, o aplicativo pode acessar o Google Drive
      final driveApi = drive.DriveApi(authClient);
      _listFiles(driveApi);  // Lista os arquivos do Google Drive
    }).catchError((e) {
      // Exibe um erro caso a autenticação falhe
      if (kDebugMode) {
        print('Erro na autenticação: $e');
      }
    });
  }

  // Função para listar os arquivos do Google Drive
  Future<void> _listFiles(drive.DriveApi driveApi) async {
    final fileList = await driveApi.files.list();  // Pega a lista de arquivos do Google Drive
    setState(() {
      _files = fileList.files?.map((file) => file.name ?? 'Sem Nome').toList() ?? [];  // Atualiza a lista de arquivos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Drive API'),  // Título exibido na barra superior
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centraliza o conteúdo na tela
          children: [
            ElevatedButton(
              onPressed: _authenticate,  // Quando o botão é clicado, inicia a autenticação
              child: const Text('Autenticar com Google'),  // Texto exibido no botão
            ),
            Expanded(
              // Exibe a lista de arquivos do Google Drive
              child: ListView.builder(
                itemCount: _files.length,  // Define quantos arquivos exibir
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_files[index]),  // Exibe o nome do arquivo
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
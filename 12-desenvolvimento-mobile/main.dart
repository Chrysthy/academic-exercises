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
//      keytool -keystore C:\Users\eduardo.mendes\.android\debug.keystore -list -v
//          senha: android
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
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Instancia o GoogleSignIn - esta classe gerencia o processo de login.
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Aqui você define o escopo da API que você quer acessar (Google Drive, neste exemplo).
    scopes: ['https://www.googleapis.com/auth/drive.file'],
  );

  // Variável para armazenar as informações do usuário após o login.
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    // Monitora mudanças no estado do login do usuário.
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
  }

  // Função para fazer o login com o Google.
  Future<void> _handleSignIn() async {
    try {
      // Chama o processo de login do Google.
      await _googleSignIn.signIn();
      // Se o login for bem-sucedido, os dados do usuário serão salvos em _currentUser.
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }  // Mostra qualquer erro que ocorrer no processo de login.
    }
  }

  // Função para fazer o logout do Google.
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login com Google'),
      ),
      body: Center(
        child: _currentUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bem-vindo, ${_currentUser?.displayName}!'),
                  ElevatedButton(
                    onPressed: _handleSignOut,
                    child: const Text('Logout'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: _handleSignIn,
                child: const Text('Fazer login com Google'),
              ),
      ),
    );
  }
}
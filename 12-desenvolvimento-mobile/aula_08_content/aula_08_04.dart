// Integrando Outras APIs do Google
//  Usando a API do Google Calendar
//  1.	Adicionar Dependências ao pubspec.yaml
//  2.	Código para Listar Eventos do Google Calendar

// Este código autentica o usuário e lê dados de uma planilha do Google Sheets, exibindo-os em uma lista.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  // Biblioteca Flutter para criar a interface
import 'package:googleapis/sheets/v4.dart' as sheets;  // Biblioteca para acessar o Google Sheets
import 'package:googleapis_auth/auth_io.dart';  // Biblioteca para autenticação do Google
// Biblioteca para fazer requisições HTTP (não utilizada diretamente)

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp());
}

// Define a estrutura básica do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define as cores do tema do aplicativo com tons de azul
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Cor principal azul
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Fundo da tela em azul claro
      ),
      home: const HomeScreen(),  // Define a tela inicial como 'HomeScreen'
    );
  }
}

// Tela inicial do aplicativo
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();  // Cria o estado da tela, onde acontece a lógica
}

// Estado da tela 'HomeScreen', onde as funções de autenticação e leitura de planilha são controladas
class _HomeScreenState extends State<HomeScreen> {
  
  // Credenciais necessárias para autenticar e acessar o Google Sheets
  final _clientId = ClientId('YOUR_CLIENT_ID', 'YOUR_CLIENT_SECRET');  // Substitua pelas suas credenciais
  final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];  // Permissões para leitura do Google Sheets

  final List<List<Object>> _values = [];  // Lista que armazena os dados da planilha lidos

  // Função que autentica o usuário com o Google
  Future<void> _authenticate() async {
    await clientViaUserConsent(_clientId, _scopes, (url) {
      // Exibe a URL onde o usuário pode fazer login e dar permissão
      if (kDebugMode) {
        print('Por favor, faça login em: $url');
      }
    }).then((authClient) {
      // Após a autenticação, acessa a planilha
      final sheetsApi = sheets.SheetsApi(authClient);
      _readSheet(sheetsApi);  // Lê os dados da planilha
    }).catchError((e) {
      // Exibe um erro caso a autenticação falhe
      if (kDebugMode) {
        print('Erro na autenticação: $e');
      }
    });
  }

  // Função que lê os dados da planilha do Google Sheets
  Future<void> _readSheet(sheets.SheetsApi sheetsApi) async {
    setState(() {
      // Se os dados forem encontrados, armazena na lista '_values'
// Permite que a lista interna tenha objetos nulos

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sheets API'),  // Título exibido na barra superior
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os itens na tela
          children: [
            ElevatedButton(
              onPressed: _authenticate,  // Inicia a autenticação quando o botão é clicado
              child: const Text('Autenticar com Google'),  // Texto exibido no botão
            ),
            Expanded(
              // Exibe os dados da planilha em uma lista
              child: ListView.builder(
                itemCount: _values.length,  // Número de itens na lista (linhas da planilha)
                itemBuilder: (context, index) {
                  // Para cada linha da planilha, exibe os valores separados por vírgula
                  return ListTile(
                    title: Text(_values[index].join(', ')),  // Exibe os valores da linha
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
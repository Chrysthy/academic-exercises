// Este código em Flutter cria um aplicativo simples que permite ao usuário selecionar um arquivo 
// do seu dispositivo e fazer o upload desse arquivo para o Google Cloud Storage via Firebase.

// Importações necessárias para o funcionamento do Flutter, Firebase e funcionalidades de upload de arquivos
import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart';  // Biblioteca principal do Flutter para interface de usuário
import 'package:firebase_core/firebase_core.dart';  // Necessária para iniciar o Firebase no app
import 'package:firebase_storage/firebase_storage.dart';  // Usada para fazer upload de arquivos no Google Cloud Storage
import 'package:file_picker/file_picker.dart';  // Permite que o usuário selecione um arquivo do dispositivo
import 'dart:io';  // Necessário para trabalhar com arquivos no sistema

// Função principal que é executada ao iniciar o aplicativo
void main() async {
  // Garante que o Flutter esteja pronto para carregar antes de fazer qualquer coisa
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase no aplicativo
  await Firebase.initializeApp();

  // Inicia a interface do aplicativo
  runApp(const MyApp());
}

// Classe principal do aplicativo, que define o visual e o comportamento geral
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload para Cloud Storage',  // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define o tema de cores do aplicativo
      ),
      home: const MyHomePage(),  // Define a página principal do app
    );
  }
}

// A página principal do aplicativo
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();  // Cria o estado da página principal
}

// O estado da página principal, onde a lógica do aplicativo acontece
class _MyHomePageState extends State<MyHomePage> {
  File? _file;  // Armazena o arquivo selecionado pelo usuário

  // Função que permite o usuário escolher um arquivo do dispositivo
  Future<void> _pickFile() async {
    // Abre o seletor de arquivos
    final result = await FilePicker.platform.pickFiles();
    
    // Se o usuário escolheu um arquivo, armazena-o na variável _file
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  // Função que faz o upload do arquivo selecionado para o Google Cloud Storage
  Future<void> _uploadFile() async {
    // Se nenhum arquivo foi escolhido, não faz nada
    if (_file == null) return;

    try {
      // Cria uma referência ao Google Cloud Storage
      FirebaseStorage storage = FirebaseStorage.instance;

      // Define o caminho onde o arquivo será salvo, com o nome original do arquivo
      Reference ref = storage.ref().child('uploads/${_file!.path.split('/').last}');

      // Inicia o upload do arquivo
      UploadTask uploadTask = ref.putFile(_file!);

      // Escuta os eventos de progresso do upload (opcional)
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        if (kDebugMode) {
          print('Progresso: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
        }
      });

      // Espera o upload ser concluído e obtém o URL do arquivo salvo na nuvem
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      if (kDebugMode) {
        print('Upload concluído! URL do arquivo: $downloadUrl');
      }
    } catch (e) {
      // Se ocorrer algum erro, exibe a mensagem de erro
      if (kDebugMode) {
        print('Erro ao fazer upload: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define o layout da tela principal
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload de Arquivo'),  // Título na barra superior
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Botão que permite o usuário escolher um arquivo
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('Escolher Arquivo'),
            ),
            const SizedBox(height: 20),  // Espaçamento entre os botões
            // Exibe o nome do arquivo escolhido (se houver)
            _file != null ? Text('Arquivo: ${_file!.path.split('/').last}') : Container(),
            const SizedBox(height: 20),
            // Botão que faz o upload do arquivo escolhido
            ElevatedButton(
              onPressed: _uploadFile,
              child: const Text('Fazer Upload'),
            ),
          ],
        ),
      ),
    );
  }
}

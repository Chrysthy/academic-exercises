// Integrando Firebase com Flutter
//  Configurando Firebase no Projeto Flutter
//    1.	Adicionar Dependências ao pubspec.yaml
//      dependencies:
//        firebase_core: latest_version
//        firebase_auth: latest_version
//        cloud_firestore: latest_version
//    2.	Instalar Dependências
//        flutter pub get
//    3.	Configuração no Firebase Console
//        Acesse o Firebase Console.
//        Crie um novo projeto ou use um existente.
//      	Adicione um novo aplicativo (Android/iOS).
//      	Baixe o arquivo google-services.json (Android) ou GoogleService-Info.plist (iOS) e adicione ao projeto.
//    4.	Configurar o main.dart
// Utilizando Firestore
//  1.	Adicionar Dados ao Firestore
//  2.	Ler Dados do Firestore
// Utilizando Authentication
//  1.	Registrar um Usuário
//  2.	Autenticar um Usuário

// Este código cria um aplicativo Flutter que permite:
//  Adicionar dados ao Firestore: Um banco de dados em tempo real no Firebase onde são armazenadas informações de usuários.
//  Ler dados do Firestore: Exibir em uma lista os usuários que foram salvos no Firestore.
//  Registrar um novo usuário no Firebase Authentication: Criar uma conta de usuário com email e senha.
//  Autenticar um usuário existente: Fazer login de um usuário já registrado com email e senha.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Inicializa Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// Classe principal que representa o aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Firestore e Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define um tema azul
        scaffoldBackgroundColor: Colors.blue.shade50, // Cor de fundo da tela principal (tom claro de azul)
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.blue.shade800),  // Texto principal com tom mais escuro de azul
          bodyMedium: TextStyle(color: Colors.blue.shade600),  // Outro tom de azul para texto secundário
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue.shade600, // Cor do texto nos botões (branco)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),  // Bordas arredondadas nos botões
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding dentro dos botões
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

// Tela inicial que permite registro, login e visualização de usuários
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  // Instância do Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Instância do Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  HomeScreen({super.key});

  // Função para adicionar um novo usuário ao Firestore
  Future<void> addUser() {
    return firestore.collection('users').add({
      'name': 'John Doe', // Nome do usuário que será salvo
      'email': 'johndoe@example.com', // Email do usuário que será salvo
    }).then((value) {
      if (kDebugMode) {
        print("Usuário adicionado com sucesso");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Erro ao adicionar usuário: $error");
      }
    });
  }

  // Função para registrar um novo usuário com email e senha no Firebase Authentication
  Future<void> registerUser(String email, String password) async {
    try {
      // Registra o usuário usando o email e a senha fornecidos
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print("Usuário registrado: ${userCredential.user?.email}");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Erro ao registrar usuário: $e");
      }
    }
  }

  // Função para autenticar (fazer login) de um usuário já registrado
  Future<void> loginUser(String email, String password) async {
    try {
      // Autentica o usuário com o email e a senha fornecidos
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print("Usuário autenticado: ${userCredential.user?.email}");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Erro ao autenticar usuário: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Firestore e Auth', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade700,  // Cor da AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Centraliza o conteúdo verticalmente
        crossAxisAlignment: CrossAxisAlignment.center,  // Centraliza o conteúdo horizontalmente
        children: [
          // Exibe uma lista de usuários armazenados no Firestore
          Expanded(
            child: StreamBuilder(
              stream: firestore.collection('users').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(); // Exibe um indicador de carregamento enquanto os dados estão sendo recuperados
                }
                // Exibe os usuários em uma lista
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return ListTile(
                      title: Text(document['name'], style: TextStyle(color: Colors.blue.shade900)), // Nome do usuário
                      subtitle: Text(document['email'], style: TextStyle(color: Colors.blue.shade600)), // Email do usuário
                    );
                  }).toList(),
                );
              },
            ),
          ),

          // Botão para registrar um novo usuário
          ElevatedButton(
            onPressed: () {
              // Registrar um usuário com email e senha fixos (exemplo)
              registerUser('example@example.com', 'password123');
            },
            child: const Text('Registrar Usuário'),
          ),

          // Botão para fazer login de um usuário
          ElevatedButton(
            onPressed: () {
              // Fazer login com o mesmo email e senha (exemplo)
              loginUser('example@example.com', 'password123');
            },
            child: const Text('Login Usuário'),
          ),

          // Botão para adicionar um novo usuário ao Firestore
          ElevatedButton(
            onPressed: () {
              addUser(); // Adiciona um novo usuário ao Firestore
            },
            child: const Text('Adicionar Usuário ao Firestore'),
          ),
        ],
      ),
    );
  }
}

// Tratamento de Dados JSON
//  Convertendo JSON para Objetos Dart
//    1.	Modelo de Dados
//    2.	Exemplo de Conversão
//  Convertendo Objetos Dart para JSON
//    1.	Método toJson
//    2.	Exemplo de Conversão e Envio

import 'package:flutter/material.dart'; // Biblioteca principal para criar a interface gráfica.
import 'package:http/http.dart' as http; // Biblioteca para fazer requisições HTTP.
import 'dart:convert'; // Biblioteca para conversão de JSON.

void main() {
  runApp(const MyApp()); // Inicia o aplicativo.
}

// Classe Post que representa os dados do post que estamos manipulando.
class Post {
  final int userId; // ID do usuário.
  final int id; // ID do post.
  final String title; // Título do post.
  final String body; // Corpo do post.

  // Construtor da classe Post.
  Post({required this.userId, required this.id, required this.title, required this.body});

  // Método que converte JSON em um objeto Dart (Post).
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Método que converte um objeto Dart (Post) para JSON.
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// Função para buscar dados de um post (GET request).
Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // Converte JSON para um objeto Post.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao carregar dados');
  }
}

// Função para enviar um novo post (POST request).
Future<http.Response> createPost(Post post) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode(post.toJson()), // Converte o objeto Post para JSON.
  );

  if (response.statusCode == 201) {
    return response; // Retorna a resposta se for bem-sucedido.
  } else {
    throw Exception('Falha ao criar post');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple), // Cor principal roxa.
      home: const HomeScreen(), // Define a tela inicial como 'HomeScreen'.
    );
  }
}

// Tela principal do aplicativo.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Define o estado da tela.
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Post>? _futurePost; // Variável para armazenar o post retornado da API.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 07.03 - Tratamento de Dados JSON'), // Título da barra superior.
        backgroundColor: Colors.purple, // Cor de fundo da AppBar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Define o espaçamento ao redor do conteúdo.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente.
          children: <Widget>[
            // Botão para buscar o post da API.
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futurePost = fetchPost(); // Quando pressionado, faz a requisição para buscar o post.
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Cor de fundo do botão.
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Tamanho do botão.
                textStyle: const TextStyle(fontSize: 18), // Tamanho do texto do botão.
              ),
              child: const Text('Buscar Post'),
            ),
            const SizedBox(height: 20), // Espaçamento entre o botão e o conteúdo.

            // Exibe o resultado da requisição (seja o post ou uma mensagem de erro).
            FutureBuilder<Post>(
              future: _futurePost, // O Future que contém o resultado da requisição.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Se ainda está aguardando a resposta, mostra um círculo de carregamento.
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Se houver erro, mostra a mensagem de erro.
                  return Text('Erro: ${snapshot.error}', style: const TextStyle(color: Colors.red));
                } else if (snapshot.hasData) {
                  // Se os dados foram recebidos com sucesso, exibe o título e o corpo do post.
                  return Column(
                    children: [
                      Text(
                        'Título: ${snapshot.data!.title}', // Exibe o título do post.
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Corpo: ${snapshot.data!.body}', // Exibe o corpo do post.
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                } else {
                  return const Text('Pressione o botão para buscar o post.');
                }
              },
            ),

            const SizedBox(height: 20), // Espaçamento entre os widgets.

            // Botão para criar um novo post.
            ElevatedButton(
              onPressed: () {
                // Cria um novo post e envia para a API.
                Post newPost = Post(userId: 1, id: 101, title: 'Novo Post', body: 'Este é um novo post criado via API');
                createPost(newPost).then((response) {
                  if (response.statusCode == 201) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Post criado com sucesso!')),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor de fundo verde para o botão "Criar Post".
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Criar Post'),
            ),
          ],
        ),
      ),
    );
  }
}
// Consumindo APIs REST com Flutter
//  Adicionando Dependência ao pubspec.yaml
//    http: ^0.13.3
//  Fazendo uma Requisição GET
//    1.	Importar o pacote http
//    2.	Exemplo de Requisição GET

// Este exemplo mostra como fazer uma requisição GET para um endpoint de teste, e exibir o resultado na interface do usuário.

import 'package:flutter/material.dart'; // Biblioteca principal para criar a interface no Flutter.
import 'package:http/http.dart' as http; // Biblioteca que permite fazer requisições HTTP (para consumir APIs).
import 'dart:convert'; // Biblioteca que permite converter JSON para um formato que o Dart possa entender.

void main() {
  runApp(const MyApp()); // Função principal que inicia o aplicativo.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal do aplicativo (azul).
      ),
      home: const HomeScreen(), // Define a tela inicial (HomeScreen) do aplicativo.
    );
  }
}

// A classe HomeScreen é a tela principal onde o usuário vai interagir.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Cria o estado da tela (dados e comportamento).
}

class _HomeScreenState extends State<HomeScreen> {
  // Esta variável guarda a mensagem de status que será exibida na tela.
  String _statusMessage = "Clique em 'Iniciar Requisição' para começar";

  // Esta função faz a requisição HTTP passo a passo e atualiza a tela em cada etapa.
  Future<void> fetchData() async {
    setState(() {
      _statusMessage = "Inicializando..."; // Passo 1: Informando que a requisição está começando.
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulação de um pequeno atraso para visualização.

    setState(() {
      _statusMessage = "Requisição enviada..."; // Passo 2: A requisição foi enviada para a API.
    });

    try {
      // Faz uma requisição GET para a API.
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      // Se a requisição foi bem-sucedida (status 200), processa o resultado.
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['title']; // Extrai o título dos dados JSON retornados.

        setState(() {
          _statusMessage = "Resposta recebida: $data"; // Passo 3: Exibe o título recebido da API.
        });
      } else {
        setState(() {
          _statusMessage = "Erro na requisição: Código ${response.statusCode}"; // Se a requisição falhou, mostra o código de erro.
        });
      }
    } catch (e) {
      // Se houver um erro durante o processo, captura e exibe a mensagem de erro.
      setState(() {
        _statusMessage = "Erro: Falha ao fazer a requisição"; // Exibe uma mensagem de erro.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 07.02 - Consumindo APIs REST com Flutter'), // Título que aparece na barra superior do app.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor do conteúdo da tela.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente na tela.
          children: <Widget>[
            // Texto que exibe a mensagem de status da requisição (muda conforme o passo atual).
            Text(
              _statusMessage, // Exibe a variável _statusMessage.
              textAlign: TextAlign.center, // Centraliza o texto.
              style: const TextStyle(fontSize: 18, color: Colors.black), // Define o tamanho e a cor do texto.
            ),
            const SizedBox(height: 20), // Adiciona um espaçamento de 20 pixels entre o texto e o botão.
            
            // Botão para iniciar a requisição.
            ElevatedButton(
              onPressed: () {
                fetchData(); // Quando o botão for pressionado, inicia a requisição chamando a função fetchData().
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Define o tamanho do botão.
                textStyle: const TextStyle(fontSize: 16), // Define o tamanho do texto dentro do botão.
              ),
              child: const Text('Iniciar Requisição'), // Texto que aparece dentro do botão.
            ),
          ],
        ),
      ),
    );
  }
}
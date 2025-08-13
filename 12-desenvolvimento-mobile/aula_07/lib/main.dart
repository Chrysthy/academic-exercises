// Boas Práticas e Segurança em APIs REST

//  Boas Práticas
//    1.	Estrutura Clara de Endpoints
//      Use nomes claros e verbos HTTP apropriados para seus endpoints.
//    2.	Paginação e Limitação de Resultados
//      Implemente paginação para lidar com grandes volumes de dados.
//    3.	Documentação da API
//      Mantenha uma documentação clara e acessível para sua API, utilizando ferramentas como Swagger ou Postman.
//  Segurança
//    1.	Autenticação e Autorização
//      Utilize OAuth 2.0, JWT ou outros métodos de autenticação robusta.
//    2.	Validação de Dados
//      Valide todos os dados de entrada no servidor para prevenir injeções de SQL e outros tipos de ataques.
//    3.	CORS
//      Configure CORS (Cross-Origin Resource Sharing) para controlar o acesso a partir de diferentes origens.
//    4.	HTTPS
//      Sempre utilize HTTPS para encriptar a comunicação entre cliente e servidor.

import 'package:flutter/material.dart'; // Biblioteca principal para criar a interface do usuário.
import 'package:http/http.dart' as http; // Biblioteca para fazer requisições HTTP.
import 'dart:convert'; // Biblioteca para manipulação de JSON.

void main() {
  runApp(const MyApp()); // Inicia o aplicativo.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple), // Define a cor principal do aplicativo.
      home: const HomeScreen(), // Define a tela inicial do app.
    );
  }
}

// Classe HomeScreen que será exibida ao iniciar o aplicativo.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

// Estado da HomeScreen que lida com as requisições e exibe os resultados.
class _HomeScreenState extends State<HomeScreen> {
  String _responseMessage = "Pressione o botão para buscar usuários"; // Variável para armazenar a resposta da API.

  // FUNÇÃO QUE FAZ UMA REQUISIÇÃO GET PARA BUSCAR USUÁRIOS
  Future<void> fetchUsers() async {
    // ESTRUTURA CLARA DE ENDPOINT: USO DE URL BEM DEFINIDA E PADRONIZADA
    final url = Uri.parse('https://api.exemplo.com/v1/users?page=1&limit=10');

    // SEGURANÇA: AUTENTICAÇÃO COM BEARER TOKEN USADO NO CABEÇALHO
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer SEU_TOKEN_AQUI', // Autenticação segura via token.
    };

    try {
      // FAZENDO REQUISIÇÃO GET COM PAGINAÇÃO E LIMITE DE RESULTADOS
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Converte o JSON retornado em um objeto compreensível.
        final data = jsonDecode(response.body);

        setState(() {
          _responseMessage = "Usuários recebidos: ${data['total']}"; // Exibe a quantidade de usuários recebida.
        });
      } else {
        setState(() {
          _responseMessage = "Erro: ${response.statusCode}"; // Exibe mensagem de erro.
        });
      }
    } catch (error) {
      setState(() {
        _responseMessage = "Erro ao fazer a requisição"; // Mensagem de erro em caso de exceção.
      });
    }
  }

  // FUNÇÃO PARA CRIAR UM NOVO USUÁRIO (REQUISIÇÃO POST)
  Future<void> createUser() async {
    final url = Uri.parse('https://api.exemplo.com/v1/users');

    // SEGURANÇA: AUTENTICAÇÃO E ENVIO DE DADOS SEGUROS COM O BEARER TOKEN E JSON
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer SEU_TOKEN_AQUI', // Autenticação segura.
    };

    // SEGURANÇA: VALIDAÇÃO DOS DADOS ANTES DE ENVIAR (AQUI ESTÁ PRONTO PARA SER VALIDADO NO SERVIDOR)
    final body = jsonEncode({
      'userId': 1,
      'title': 'Novo Usuário',
      'body': 'Criando um novo usuário com boas práticas',
    });

    try {
      // FAZENDO REQUISIÇÃO POST
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        setState(() {
          _responseMessage = "Usuário criado com sucesso!";
        });
      } else {
        setState(() {
          _responseMessage = "Erro ao criar usuário: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        _responseMessage = "Erro ao criar o usuário";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boas Práticas em APIs REST'), // Título da barra superior.
        backgroundColor: Colors.purple, // Cor de fundo da AppBar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor do conteúdo.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente.
          children: <Widget>[
            // Exibe a resposta da API de forma clara.
            Card(
              color: Colors.purple[50], // Fundo suave no card.
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10), // Espaçamento no card.
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _responseMessage, // Exibe a resposta da API.
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.purple[900]), // Estilo da mensagem.
                ),
              ),
            ),

            const SizedBox(height: 20), // Espaçamento entre o texto e o botão.

            // BOTÃO PARA BUSCAR USUÁRIOS
            ElevatedButton(
              onPressed: fetchUsers,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Cor do botão.
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Tamanho do botão.
                textStyle: const TextStyle(fontSize: 18), // Tamanho do texto do botão.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordas arredondadas.
                ),
              ), // Chama a função que faz a requisição GET.
              child: const Text('Buscar Usuários'),
            ),

            const SizedBox(height: 20),

            // BOTÃO PARA CRIAR USUÁRIO
            ElevatedButton(
              onPressed: createUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor do botão.
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordas arredondadas.
                ),
              ), // Chama a função que faz a requisição POST.
              child: const Text('Criar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}

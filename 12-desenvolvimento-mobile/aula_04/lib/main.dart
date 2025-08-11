// Passos
// 1 - Adicionar dependência no pubspec.yaml
//     shared_preferences: ^2.3.2 permite que você armazene dados simples como pares de chave-valor
// 2 - Importa o pacote no arquivo Dart
// 3 -	Salvar um dado (String)
// 4 -	Recuperar um dado (String)

// Este exemplo cria um aplicativo Flutter simples que permite ao usuário digitar um texto e salvá-lo usando shared_preferences. 
// O texto salvo é recuperado e exibido na tela quando o aplicativo é iniciado.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Pacote para salvar e carregar dados localmente

// Função principal onde o programa começa a ser executado
void main() {
  runApp(const MyApp()); // Executa o aplicativo MyApp
}

// MyApp é o widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o contêiner raiz que define o tema e navegação do app
    return const MaterialApp(
      home: HomeScreen(), // Define a tela inicial como HomeScreen
    );
  }
}

// Classe HomeScreen é a tela inicial que permite salvar e carregar dados
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

// Estado da tela inicial que gerencia os dados e as interações
class _HomeScreenState extends State<HomeScreen> {
  // Controlador para capturar o texto digitado no campo de texto
  final TextEditingController _controller = TextEditingController();

  // String que armazenará o dado carregado ou salvo
  String _savedData = 'Nenhum dado salvo';

  // Função chamada quando a tela é inicializada
  @override
  void initState() {
    super.initState();
    _loadData(); // Carrega os dados salvos ao iniciar a tela
  }

  // Função para salvar os dados usando SharedPreferences
  Future<void> _saveData(String value) async {
    // Obtém uma instância de SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Salva a string com a chave 'my_key'
    await prefs.setString('my_key', value);

    // Atualiza a interface com o novo dado salvo
    setState(() {
      _savedData = value;
    });
  }

  // Função para carregar os dados salvos
  Future<void> _loadData() async {
    // Obtém uma instância de SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Carrega a string salva ou mostra 'Nenhum dado salvo' se não houver dados
    setState(() {
      _savedData = prefs.getString('my_key') ?? 'Nenhum dado salvo';
    });
  }

  // Construção da interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar que exibe o título no topo da tela
      appBar: AppBar(
        title:
            const Text('Aula 04.01 - Persistência de Dados'), // Título da tela
      ),
      // Corpo da tela, com campo de texto, botão e o dado salvo
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Adiciona espaçamento ao redor dos widgets
        child: Column(
          children: <Widget>[
            // Campo de texto onde o usuário digita o dado que será salvo
            TextField(
              controller:
                  _controller, // Controlador que captura o texto digitado
              decoration: const InputDecoration(
                  labelText: 'Digite um texto'), // Rótulo do campo de texto
            ),
            const SizedBox(
                height: 20), // Espaço entre o campo de texto e o botão

            // Botão para salvar o dado digitado
            ElevatedButton(
              onPressed: () {
                // Quando o botão é pressionado, o texto digitado é salvo
                _saveData(_controller.text);
              },
              child: const Text('Salvar Dados'), // Texto exibido no botão
            ),
            const SizedBox(
                height: 20), // Espaço entre o botão e o texto exibido abaixo

            // Exibe o dado salvo ou uma mensagem se não houver nada salvo
            Text('Dado salvo: $_savedData'), // Mostra o dado carregado ou salvo
          ],
        ),
      ),
    );
  }
}
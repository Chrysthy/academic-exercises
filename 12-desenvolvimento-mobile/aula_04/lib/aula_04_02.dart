// Configurando SQLite com sqflite
//  1.	Adicionar dependência ao pubspec.yaml
//        A dependência sqflite: ^2.0.0+4 no Flutter permite que você utilize um banco de dados SQLite local dentro do seu aplicativo. 
//        sqflite: ^2.0.0+4
//        A dependência path: ^1.8.0 no Flutter é uma biblioteca muito útil para manipular caminhos de arquivos de maneira multiplataforma. 
//        path: ^1.8.0
//  2.	Importar os pacotes necessários
//  3.	Inicializar o banco de dados
//  4.	Inserir um item no banco de dados
//  5.	Recuperar itens do banco de dados

// Este exemplo mostra como configurar o SQLite com sqflite, criar uma tabela, inserir itens e 
// recuperar itens para exibição em uma lista. 
// O aplicativo permite que o usuário insira nomes que são salvos no banco de dados e exibidos em uma lista.

import 'package:flutter/material.dart'; // Biblioteca que permite criar a interface gráfica no Flutter.
import 'package:sqflite/sqflite.dart'; // Biblioteca que fornece suporte para banco de dados SQLite.
import 'package:path/path.dart'; // Biblioteca que facilita o uso de caminhos de arquivos, independentemente do sistema operacional.

void main() {
  runApp(const MyApp()); // Função principal que inicia o aplicativo Flutter.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 // Classe que define a estrutura principal do aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple, // Define o tema principal com uma cor roxa.
        scaffoldBackgroundColor: Colors.purple[50], // Define a cor de fundo do app.
      ),
      home: const HomeScreen(), // Define a tela principal do app como 'HomeScreen'.
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 // Define a tela inicial que pode mudar de estado.
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Cria o estado para a tela HomeScreen.
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController(); // Controlador que captura o texto digitado pelo usuário.
  List<Map<String, dynamic>> _items = []; // Lista que armazenará os dados recuperados do banco de dados.

  @override
  void initState() {
    super.initState();
    _loadItems(); // Carrega os itens do banco de dados quando a tela é inicializada.
  }

  // Função que inicializa o banco de dados, cria um arquivo para armazená-lo no dispositivo
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath(); // Obtém o caminho onde o banco de dados será salvo no dispositivo.
    return openDatabase(
      join(path, 'example.db'), // Cria ou abre um banco de dados chamado 'example.db'.
      onCreate: (database, version) async {
        // Se o banco de dados for criado pela primeira vez, cria uma tabela chamada 'items' com duas colunas: 'id' e 'name'.
        await database.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)', // Cria a tabela 'items'.
        );
      },
      version: 1, // Define a versão do banco de dados. Isso é útil quando você quiser atualizar sua estrutura no futuro.
    );
  }

  // Função que insere um item no banco de dados.
  Future<void> insertItem(String name) async {
    final db = await initializeDB(); // Inicializa o banco de dados e obtém a referência para ele.
    await db.insert(
      'items', // Nome da tabela onde o item será inserido.
      {'name': name}, // Os dados a serem inseridos (neste caso, o nome que o usuário digitou).
      conflictAlgorithm: ConflictAlgorithm.replace, // Se houver um conflito (por exemplo, um item com o mesmo 'id'), ele será substituído.
    );
    _loadItems(); // Recarrega a lista de itens para mostrar o novo item inserido.
  }

  // Função que carrega todos os itens do banco de dados e os exibe na tela.
  Future<void> _loadItems() async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    final data = await db.query('items'); // Consulta todos os itens da tabela 'items'.
    setState(() {
      _items = data; // Atualiza a lista de itens para exibi-los na interface.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite com Flutter'), // Define o título da barra superior do aplicativo.
        backgroundColor: Colors.purple, // Define a cor de fundo da AppBar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona um espaçamento ao redor do conteúdo.
        child: Column(
          children: <Widget>[
            // Campo de texto para inserir o nome.
            TextField(
              controller: _controller, // O campo de texto onde o usuário digita um nome.
              decoration: InputDecoration(
                labelText: 'Digite um nome',
                labelStyle: const TextStyle(color: Colors.purple), // Cor do rótulo do campo de texto.
                filled: true, // Ativa o preenchimento de fundo.
                fillColor: Colors.purple[100], // Cor de fundo do campo de texto.
                border: OutlineInputBorder( // Define a borda do campo de texto.
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre o campo de texto e o botão.

            // Botão para inserir o nome no banco de dados.
            ElevatedButton(
              onPressed: () {
                insertItem(_controller.text); // Quando o botão é pressionado, o texto digitado é salvo no banco de dados.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Cor de fundo do botão.
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Aumenta o tamanho do botão.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Arredonda as bordas do botão.
                ),
              ),
              child: const Text(
                'Inserir no Banco de Dados',
                style: TextStyle(fontSize: 18), // Define o tamanho do texto no botão.
              ), // Texto que aparece no botão.
            ),
            const SizedBox(height: 20), // Espaçamento entre o botão e a lista de itens.

            // Lista que exibe os itens salvos no banco de dados.
            Expanded(
              child: ListView.builder(
                itemCount: _items.length, // Define o número de itens que será exibido (de acordo com o banco de dados).
                itemBuilder: (context, index) {
                  return Card( // Estiliza cada item em um cartão.
                    margin: const EdgeInsets.symmetric(vertical: 8), // Define o espaçamento entre os itens.
                    color: Colors.purple[50], // Cor de fundo do cartão.
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.purple), // Ícone ao lado do nome.
                      title: Text(
                        _items[index]['name'], // Mostra o nome de cada item na lista.
                        style: const TextStyle(
                          fontSize: 18, // Define o tamanho do texto.
                          color: Colors.black87,
                        ),
                      ),
                    ),
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
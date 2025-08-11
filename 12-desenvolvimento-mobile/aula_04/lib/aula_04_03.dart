// Operações CRUD com SQLite
//  Operação de Criação (Create)
//    1.	Inserir um novo item
//  Operação de Leitura (Read)
//    2.	Recuperar todos os itens
//  Operação de Atualização (Update)
//    3.	Atualizar um item existente
//  Operação de Exclusão (Delete)
//    4.	Deletar um item existente

// Este exemplo demonstra todas as operações CRUD usando SQLite. 
// O usuário pode inserir, atualizar, visualizar e deletar itens no banco de dados através de uma interface simples.

import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter para construir a interface do app.
import 'package:sqflite/sqflite.dart'; // Importa a biblioteca para usar banco de dados SQLite.
import 'package:path/path.dart'; // Importa a biblioteca para manipulação de caminhos de arquivos (útil para localizar o banco de dados).

// Função principal que inicia o app.
void main() {
  runApp(const MyApp());
}

// Classe principal do app. Define como o app vai se comportar e qual é a tela inicial.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define o tema do app, com azul como cor principal.
      ),
      home: const HomeScreen(), // Define a tela inicial do app como sendo a "HomeScreen".
    );
  }
}

// Tela principal do app. Como essa tela precisa mudar quando o usuário insere ou edita dados, ela é um StatefulWidget.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Cria o estado da tela principal.
}

// Classe que contém o estado da tela principal (dados e comportamento da tela).
class _HomeScreenState extends State<HomeScreen> {
  // Controlador do campo de texto. Armazena o que o usuário digita.
  final TextEditingController _controller = TextEditingController();
  
  // Lista que vai armazenar os dados que vêm do banco de dados (os itens salvos).
  List<Map<String, dynamic>> _items = [];
  
  // Variável para armazenar o ID do item que está sendo editado (usada no update).
  int? _selectedId;
  
  // Texto do botão, que muda entre "Inserir" e "Atualizar" dependendo da operação.
  String buttonText = 'Inserir';

  @override
  void initState() {
    super.initState();
    _loadItems(); // Carrega os itens do banco de dados assim que a tela é aberta.
  }

  // Função que inicializa o banco de dados, criando a tabela de itens caso ela ainda não exista.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath(); // Obtém o caminho onde o banco de dados será armazenado no dispositivo.
    return openDatabase(
      join(path, 'example.db'), // Abre ou cria o banco de dados 'example.db' no caminho especificado.
      onCreate: (database, version) async {
        // Executa esse código quando o banco de dados é criado pela primeira vez.
        await database.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)', // Cria a tabela 'items' com uma coluna 'id' e uma coluna 'name'.
        );
      },
      version: 1, // Versão do banco de dados. Usado se for necessário atualizar a estrutura do banco no futuro.
    );
  }

  // Função que insere ou atualiza um item no banco de dados.
  Future<void> saveItem(String name) async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    
    // Se nenhum item está selecionado (nenhum ID), insere um novo item.
    if (_selectedId == null) {
      await db.insert(
        'items', // Nome da tabela onde os dados serão inseridos.
        {'name': name}, // Dados que serão inseridos: o nome que o usuário digitou.
        conflictAlgorithm: ConflictAlgorithm.replace, // Se houver um conflito, substitui o dado existente.
      );
    } else {
      // Se um item está selecionado (um ID existe), atualiza o item com o novo nome.
      await db.update(
        'items', // Nome da tabela onde os dados serão atualizados.
        {'name': name}, // Dados que serão atualizados: o nome novo.
        where: 'id = ?', // Condição para atualizar o item correto (pelo ID).
        whereArgs: [_selectedId], // O ID do item que será atualizado.
      );
      
      // Após atualizar, limpa o ID selecionado e volta o texto do botão para "Inserir".
      setState(() {
        _selectedId = null; // Limpa o ID selecionado.
        buttonText = 'Inserir'; // Muda o texto do botão para "Inserir".
      });
    }

    // Limpa o campo de texto após salvar ou atualizar.
    _controller.clear();

    // Recarrega a lista de itens para mostrar as atualizações.
    _loadItems();
  }

  // Função que exclui um item do banco de dados.
  Future<void> deleteItem(int id) async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    
    // Deleta o item cujo ID foi fornecido.
    await db.delete(
      'items', // Nome da tabela de onde o item será excluído.
      where: 'id = ?', // Condição para deletar o item correto (pelo ID).
      whereArgs: [id], // O ID do item que será excluído.
    );
    
    // Recarrega a lista de itens após a exclusão.
    _loadItems();
  }

  // Função que carrega todos os itens do banco de dados e os exibe na tela.
  Future<void> _loadItems() async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    
    // Faz uma consulta para obter todos os itens da tabela 'items'.
    final data = await db.query('items');
    
    // Atualiza a lista de itens na interface.
    setState(() {
      _items = data;
    });
  }

  // Função que seleciona um item para ser atualizado. Ela traz o nome do item para o campo de texto.
  void selectForUpdate(int id, String name) {
    setState(() {
      _controller.text = name; // Preenche o campo de texto com o nome do item.
      _selectedId = id; // Armazena o ID do item para saber que será uma atualização.
      buttonText = 'Atualizar'; // Muda o texto do botão para "Atualizar".
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operações de CRUD com SQLite'), // Título na barra superior do app.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona um espaçamento de 16 pixels ao redor do conteúdo.
        child: Column(
          children: <Widget>[
            // Campo de texto onde o usuário digita o nome a ser inserido ou atualizado.
            TextField(
              controller: _controller, // Controla o texto que o usuário digita.
              decoration: InputDecoration(
                labelText: 'Digite um nome', // Texto descritivo dentro do campo de texto.
                border: const OutlineInputBorder(), // Adiciona uma borda ao campo de texto.
                filled: true,
                fillColor: Colors.blue[50], // Define uma cor de fundo azul claro para o campo.
              ),
            ),
            const SizedBox(height: 10), // Espaçamento entre o campo de texto e o botão.
            
            // Botão para inserir ou atualizar o nome.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedId == null ? Colors.blue : Colors.orange, // O botão é azul para "Inserir" e laranja para "Atualizar".
              ),
              onPressed: () {
                saveItem(_controller.text); // Chama a função para salvar ou atualizar o nome.
              },
              child: Text(buttonText), // O texto do botão muda entre "Inserir" e "Atualizar".
            ),
            const SizedBox(height: 20), // Espaçamento entre o botão e a lista de itens.
            
            // Lista que exibe os itens salvos no banco de dados.
            Expanded(
              child: ListView.builder(
                itemCount: _items.length, // Número de itens a serem exibidos na lista.
                itemBuilder: (context, index) {
                  return Card( // Cada item é mostrado dentro de um cartão bonito.
                    color: Colors.blue[100], // Cor de fundo azul claro para o cartão.
                    margin: const EdgeInsets.symmetric(vertical: 5), // Espaçamento entre os cartões.
                    child: ListTile(
                      title: Text(
                        _items[index]['name'], // Mostra o nome do item.
                        style: const TextStyle(fontSize: 18, color: Colors.black87), // Fonte maior e cor preta.
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Define o tamanho da linha para não ocupar toda a largura.
                        children: [
                          // Botão para editar o item.
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange), // Ícone de lápis para edição, cor laranja.
                            onPressed: () {
                              selectForUpdate(_items[index]['id'], _items[index]['name']); // Chama a função que preenche o campo de texto com o nome para edição.
                            },
                          ),
                          // Botão para excluir o item.
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red), // Ícone de lixeira para exclusão, cor vermelha.
                            onPressed: () {
                              deleteItem(_items[index]['id']); // Chama a função para excluir o item.
                            },
                          ),
                        ],
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
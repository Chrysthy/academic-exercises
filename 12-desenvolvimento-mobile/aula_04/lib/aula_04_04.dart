// Melhores Práticas em Persistência de Dados

//    Estrutura e Organização do Código
//      1.	Separação de Responsabilidades
//        Mantenha a lógica de persistência separada da lógica de apresentação. Use classes de serviço ou repositório para interagir com o banco de dados.
//      2.	Uso de Models
//        Crie modelos (models) para representar seus dados de forma estruturada.
//      3.	Gerenciamento de Estado
//        Utilize pacotes de gerenciamento de estado como provider ou bloc para manter o estado da aplicação consistente.
//
//    Segurança e Performance
//      1.	Evite o Uso de Strings Literais para Consultas
//        Use parâmetros nomeados para evitar injeção de SQL.
//      2.	Compactar o Banco de Dados
//        Periodicamente, compacte o banco de dados para otimizar o espaço.
//      3.	Criptografia
//        Para dados sensíveis, considere usar criptografia para proteger informações armazenadas.
//      4.	Fechar Conexões
//        Certifique-se de fechar as conexões com o banco de dados para liberar recursos.

// Este exemplo aplica melhores práticas de persistência de dados, incluindo a separação de responsabilidades 
// com a classe DatabaseService, uso de modelos, e fechamento adequado da conexão com o banco de dados.

import 'package:flutter/material.dart'; // Biblioteca que cria a interface gráfica no Flutter.
import 'package:sqflite/sqflite.dart'; // Biblioteca para trabalhar com o banco de dados SQLite.
import 'package:path/path.dart'; // Biblioteca para manipular caminhos de arquivos (usada para localizar o banco de dados).

void main() {
  runApp(const MyApp()); // Inicia o aplicativo.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal do aplicativo.
      ),
      home: const HomeScreen(), // Define a tela inicial como 'HomeScreen'.
    );
  }
}

// CLASSE 'ITEM' REPRESENTA OS DADOS DE UM ITEM NO BANCO DE DADOS.
class Item {
  final int? id; // O ID do item, que é opcional (gerado automaticamente).
  final String name; // O nome do item.

  Item({this.id, required this.name}); // Construtor da classe Item.

  // CONVERTE UM OBJETO 'ITEM' PARA UM MAP PARA SALVAR NO BANCO DE DADOS.
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}

// SERVIÇO QUE LIDA COM TODAS AS OPERAÇÕES DO BANCO DE DADOS.
class DatabaseService {
  // FUNÇÃO QUE INICIALIZA O BANCO DE DADOS E CRIA A TABELA SE AINDA NÃO EXISTIR.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath(); // Localiza o caminho para salvar o banco de dados.
    return openDatabase(
      join(path, 'example.db'), // Abre ou cria o banco de dados chamado 'example.db'.
      onCreate: (database, version) async {
        // CRIA A TABELA 'ITEMS' COM UMA COLUNA PARA 'ID' E OUTRA PARA 'NAME'.
        await database.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
        );
      },
      version: 1, // Versão do banco de dados (para futuras atualizações).
    );
  }

  // FUNÇÃO QUE INSERE UM NOVO ITEM NO BANCO DE DADOS.
  Future<void> insertItem(Item item) async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    await db.insert(
      'items', // Tabela onde o item será inserido.
      item.toMap(), // CONVERTENDO O ITEM PARA UM MAP PARA INSERÇÃO.
      conflictAlgorithm: ConflictAlgorithm.replace, // Substitui se houver conflito.
    );
  }

  // FUNÇÃO QUE RECUPERA TODOS OS ITENS DO BANCO DE DADOS.
  Future<List<Item>> retrieveItems() async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    final List<Map<String, dynamic>> maps = await db.query('items'); // CONSULTANDO A TABELA 'ITEMS'.

    // CONVERTENDO O RESULTADO EM UMA LISTA DE OBJETOS 'ITEM'.
    return List.generate(maps.length, (i) {
      return Item(
        id: maps[i]['id'], // Atribui o id.
        name: maps[i]['name'], // Atribui o nome.
      );
    });
  }

  // FUNÇÃO QUE ATUALIZA UM ITEM NO BANCO DE DADOS.
  Future<void> updateItem(Item item) async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    await db.update(
      'items', // Tabela onde o item será atualizado.
      item.toMap(), // CONVERTENDO O ITEM PARA UM MAP PARA ATUALIZAÇÃO.
      where: 'id = ?', // Condição de qual item atualizar (pelo id).
      whereArgs: [item.id], // Passa o id do item.
    );
  }

  // FUNÇÃO QUE EXCLUI UM ITEM DO BANCO DE DADOS.
  Future<void> deleteItem(int id) async {
    final db = await initializeDB(); // Inicializa o banco de dados.
    await db.delete(
      'items', // Tabela de onde o item será excluído.
      where: 'id = ?', // Condição de qual item deletar (pelo id).
      whereArgs: [id], // Passa o id do item a ser deletado.
    );
  }

  // FUNÇÃO QUE FECHA A CONEXÃO COM O BANCO DE DADOS.
  Future<void> closeDB() async {
    final db = await initializeDB();
    await db.close(); // Fecha o banco de dados.
  }
}

// TELA PRINCIPAL DO APP, ONDE O USUÁRIO VERÁ E MANIPULARÁ OS ITENS.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState(); // Cria o estado da tela.
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService dbService = DatabaseService(); // Instância do serviço de banco de dados.
  List<Item> _items = []; // LISTA QUE ARMAZENA OS ITENS CARREGADOS DO BANCO DE DADOS.
  final TextEditingController _nameController = TextEditingController(); // Controlador do campo de texto.
  int? _editingItemId; // ARMAZENA O ID DO ITEM QUE ESTÁ SENDO EDITADO.
  String _buttonText = 'Adicionar Item'; // Define o texto do botão.

  @override
  void initState() {
    super.initState();
    _loadItems(); // CARREGANDO OS ITENS DO BANCO DE DADOS QUANDO A TELA É INICIALIZADA.
  }

  // FUNÇÃO QUE CARREGA OS ITENS DO BANCO DE DADOS.
  Future<void> _loadItems() async {
    final items = await dbService.retrieveItems(); // Recupera os itens do banco de dados.
    setState(() {
      _items = items; // ATUALIZA A LISTA DE ITENS PARA EXIBIÇÃO.
    });
  }

  // FUNÇÃO PARA LIMPAR O CAMPO DE TEXTO E REDEFINIR O ESTADO DO BOTÃO.
  void _resetForm() {
    _nameController.clear(); // Limpa o campo de texto.
    setState(() {
      _editingItemId = null; // Remove o ID do item em edição.
      _buttonText = 'Adicionar Item'; // Volta o texto do botão para "Adicionar Item".
    });
    _loadItems(); // Recarrega os itens do banco de dados.
  }

  // FUNÇÃO QUE POPULA O CAMPO DE TEXTO COM O NOME DO ITEM QUE SERÁ EDITADO.
  void _editItem(Item item) {
    setState(() {
      _nameController.text = item.name; // PREENCHE O CAMPO DE TEXTO COM O NOME DO ITEM.
      _editingItemId = item.id; // ARMAZENA O ID DO ITEM A SER EDITADO.
      _buttonText = 'Atualizar Item'; // MUDA O TEXTO DO BOTÃO PARA "ATUALIZAR ITEM".
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Melhores Práticas em Persistência de Dados'), // Título da barra superior.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Define espaçamento ao redor do conteúdo.
        child: Column(
          children: <Widget>[
            // CAMPO DE TEXTO ONDE O USUÁRIO DIGITA O NOME DO ITEM.
            TextField(
              controller: _nameController, // Controlador do campo de texto.
              decoration: InputDecoration(
                labelText: 'Digite um nome', // Texto de ajuda no campo de texto.
                border: OutlineInputBorder( // Adiciona uma borda ao campo de texto.
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10), // Espaçamento entre o campo de texto e o botão.
            ElevatedButton(
              onPressed: () {
                if (_editingItemId == null) {
                  // SE NENHUM ITEM ESTÁ SENDO EDITADO, ADICIONA UM NOVO ITEM.
                  dbService.insertItem(Item(name: _nameController.text));
                } else {
                  // SE UM ITEM ESTÁ SENDO EDITADO, ATUALIZA O ITEM.
                  dbService.updateItem(
                    Item(id: _editingItemId, name: _nameController.text),
                  );
                }
                _resetForm(); // Limpa o formulário e atualiza a lista.
              },
              child: Text(_buttonText), // O TEXTO DO BOTÃO MUDA CONFORME A AÇÃO (ADICIONAR OU ATUALIZAR).
            ),
            const SizedBox(height: 20), // Espaçamento entre o botão e a lista de itens.
            Expanded(
              // EXIBE OS ITENS EM UMA LISTA.
              child: ListView.builder(
                itemCount: _items.length, // DEFINE O NÚMERO DE ITENS A EXIBIR.
                itemBuilder: (context, index) {
                  return Card( // CADA ITEM É EXIBIDO DENTRO DE UM CARD.
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(_items[index].name), // EXIBE O NOME DO ITEM.
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue), // ÍCONE PARA EDITAR O ITEM.
                            onPressed: () {
                              _editItem(_items[index]); // CHAMA A FUNÇÃO PARA EDITAR O ITEM.
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red), // ÍCONE PARA DELETAR O ITEM.
                            onPressed: () {
                              dbService.deleteItem(_items[index].id!); // EXCLUI O ITEM.
                              _resetForm(); // Limpa o formulário e atualiza a lista.
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

  @override
  void dispose() {
    dbService.closeDB(); // FECHA O BANCO DE DADOS QUANDO A TELA FOR FECHADA.
    super.dispose();
  }
}